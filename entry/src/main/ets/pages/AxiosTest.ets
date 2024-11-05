import axios, { AxiosError, AxiosResponse } from '@ohos/axios';
import { LogUtil } from '@pura/harmony-utils';
import { Article, ArticleResponseBody, Covert, Tag } from '../bean/ArticleResponseBody';
import { DateValueBean } from '../bean/DateValueBean';
import { LogUtils } from '../utils/LogUtils';
import { Reckoner } from './Reckoner';

@Entry
@Component
struct AxiosTest {

  @State response: string = ''
  @State maxItemHeight: number = -1
  @State array :Array<Array<number>>  = new Array()
  @State testArray :Array<Tag>  = new Array()


  getRequest: (event: ClickEvent) => void = () => {
    axios<ArticleResponseBody, AxiosResponse<ArticleResponseBody>, null>({
      method: "get",
      url: 'http://fund.eastmoney.com/pingzhongdata/001051.js?v=20160518155842'
    }).then((res: AxiosResponse) => {
      let allString = JSON.stringify(res.data);
      let startString: string = ";/*累计净值走势*/var Data_ACWorthTrend = ";
      // LogUtils.info('result:' + allString)
      let start = allString.indexOf(startString)
      let end = allString.indexOf(";/*累计收益率走势")
     let newString = allString.substring(start+startString.length,end)
      // LogUtils.info('newString:' + newString)
      let responseList: number[][] = JSON.parse(newString) as Array<Array<number>>;
      this.array = responseList
        // .slice(100)
      LogUtils.info('bean:' + this.array.length)
      Reckoner.tianShuJiSuan(this.array)
    }).catch((error: AxiosError) => {
      LogUtils.info('error:' + error.message);
    })
    // this.response="dsfjijirwejgi\n jsdjfisjgirej \n jksldjfiojsgjs"
  }

  postRequest: (event: ClickEvent) => void = () => {
    axios<string, AxiosResponse<string>, null>({
      method: "post",
      url: 'https://www.wanandroid.com/user/login',
      params:{"username":"hefei","password":"123456"}
    }).then((res: AxiosResponse) => {
      LogUtils.info('result:' + JSON.stringify(res.data))
      this.response = JSON.stringify(res.data)
    }).catch((error: AxiosError) => {
      LogUtils.info('error:' + error.message);
    })
    // this.response="dsfjijirwejgi\n jsdjfisjgirej \n jksldjfiojsgjs"
  }

  postRegisterRequest: (event: ClickEvent) => void = () => {
    axios<string, AxiosResponse<string>, null>({
      method: "post",
      url: 'https://www.wanandroid.com/user/register',
      params:{"username":"hefei","password":"123456","repassword":"123456"}
    }).then((res: AxiosResponse) => {
      LogUtils.info('result:' + JSON.stringify(res.data))
      this.response = JSON.stringify(res.data)
    }).catch((error: AxiosError) => {
      LogUtils.info('error:' + error.message);
    })
    // this.response="dsfjijirwejgi\n jsdjfisjgirej \n jksldjfiojsgjs"
  }


  build() {
    Scroll() {
      Column() {
        Button('POST注册请求')
          .width('100%')
          .height(60)
          .margin({ top: 20 })
          .onClick(
            ()=>{
              LogUtil.info("pow",Math.pow(2,1).toString(),Math.pow(2,2).toString(),Math.pow(2,3).toString())
            }
            )
        Button('POST登陆请求')
          .width('100%')
          .height(60)
          .margin({ top: 20 })
          .onClick(this.postRequest)
        Button('GET请求')
          .width('100%')
          .height(60)
          .margin({ top: 20 })
          .onClick(this.getRequest)
        Text(this.response)
          .margin({ top: 20 })
          .width('100%')
          .height('auto')
          .backgroundColor('#ff00ff')
          List(){
            ForEach(this.array,(item:Array<number>,index)=>{
              ListItem(){
                Row() {
                  Text(item[1] +"----"+index).fontSize(30).fontColor("#ffffff")
                }
                .width('100%')
                .justifyContent(FlexAlign.Start)
              }
            })
          }.width('100%')
        .height('auto')
        .backgroundColor('#0000ff')
      }.width('100%')
      .height('auto')
      .justifyContent(FlexAlign.Start)
      .backgroundColor('#00ff00')
    }.width('100%')
    .height('auto')
    .backgroundColor("#ff00ff")

  }
}