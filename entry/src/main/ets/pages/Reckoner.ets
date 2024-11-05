import ArrayList from "@ohos.util.ArrayList"
import { DateUtil, LogUtil } from "@pura/harmony-utils"
import { LogUtils } from "../utils/LogUtils"

export class Reckoner {
  private static chuShiJinE = 20000
  private static maiRuBiLi = [0.95, 0.85, 0.7, 0.5, 0.25]
  private static maiChuBiLi = 1.05
  private static tianShuJieQu = 0

  public static tianShuJiSuan(input: Array<Array<number>>) {
    Reckoner.tianShuJieQu = 0
    for (let index = 0; index < 200; index++) {

      let newLocal: number[][] = input.slice(Reckoner.tianShuJieQu, input.length -1 )
      Reckoner.jiSuanMaiChuLv(newLocal)
      Reckoner.tianShuJieQu += 10
      LogUtil.info(index + "------------------------------------------------------截取：" +
      DateUtil.getFormatDateStr(newLocal[0][0]) + "---" + DateUtil.getFormatDateStr(newLocal[newLocal.length-1][0]))
    }


  }

  public static jiSuanMaiChuLv(input: Array<Array<number>>) {
    Reckoner.maiChuBiLi = 1.05
    for (let index = 0; index < 15; index++) {
      Reckoner.method(input)
      Reckoner.maiChuBiLi += 0.01

    }
  }

  public static method(input: Array<Array<number>>) {
    let touZiList = new ArrayList<TouZiBean>()
    let chuShiHua = true
    let bean: TouZiBean | undefined = undefined
    for (let i = 0; i < input.length; i++) {
      if (chuShiHua) {
        bean = new TouZiBean()
        Reckoner.chuShiHua(bean, input[i])
        touZiList.add(bean)
        chuShiHua = false
      } else {
        chuShiHua = Reckoner.meiRiJiSuan(bean!!, input[i-1], input[i])
      }
    }
    let zongShouYi = 0
    let zuiDaTouZi = 0
    for (let index = 0; index < touZiList.length; index++) {
      if (index < touZiList.length - 1) {
        zongShouYi += touZiList[index].zuiDaShouYiJinE
      }else {
        zongShouYi += (touZiList[index].meiRiYuE[touZiList[index].meiRiYuE.length-1] - touZiList[index].zongJinE)
      }
      if (zuiDaTouZi < touZiList[index].zongJinE) {
        zuiDaTouZi = touZiList[index].zongJinE
      }
    }
    LogUtil.info("总收益：" + zongShouYi
      + "---最大投资：" + zuiDaTouZi
      + "--最终收益率：" + zongShouYi / zuiDaTouZi
      + "--止盈率：" + Reckoner.maiChuBiLi
      + "----总天数：" + DateUtil.getFormatDateStr(input[0][0]) + "---" + DateUtil.getFormatDateStr(input[input.length-1][0])
    )
    BigInt
  }

  private static chuShiHua(bean: TouZiBean, data: number[]) {
    let riQi = data[0]
    let jiaGe = data[1]
    bean.maiRuCengShu = 1
    bean.chuShiJiaGe = jiaGe
    bean.chuShiRiQi = riQi
    bean.maiRuChengBen = jiaGe
    bean.zongFenShu = Reckoner.chuShiJinE / jiaGe
    bean.zongJinE = Reckoner.chuShiJinE
    bean.touZiTianShu = 1
    bean.meiRiShouYi.add(0)
    bean.meiRiShouYiLv.add(0)
    bean.meiRiYuE.add(Reckoner.chuShiJinE)
    bean.meiRiFenShu.add(bean.zongFenShu)
    bean.benJin.add(Reckoner.chuShiJinE)
    let caoZuo = new CaoZuoBean()
    caoZuo.maiRu = true
    caoZuo.jinE = Reckoner.chuShiJinE
    caoZuo.fenShu = Reckoner.chuShiJinE / jiaGe
    caoZuo.date = riQi
    caoZuo.cengShu = 1
    bean.caoZuoLieBiao.add(caoZuo)
    // LogUtil.info("初始化", JSON.stringify(bean))
  }

  private static meiRiJiSuan(bean: TouZiBean, zuoRi: number[], data: number[]): boolean {

    let riQi = data[0]
    let jiaGe = data[1]
    let zuoRiJiaGe = zuoRi[1]
    let dangRiShouYi = (jiaGe - zuoRiJiaGe) * bean.zongFenShu
    bean.meiRiShouYi.add(dangRiShouYi)
    bean.zongShouYi = bean.zongShouYi + dangRiShouYi
    bean.meiRiShouYiLv.add((jiaGe - zuoRiJiaGe) / zuoRiJiaGe)
    let dangRiYuE = bean.zongFenShu * jiaGe
    bean.meiRiYuE.add(dangRiYuE)
    bean.meiRiFenShu.add(bean.zongFenShu)
    bean.shouYiLv = (dangRiYuE - bean.zongJinE) / bean.zongJinE
    bean.touZiTianShu = bean.touZiTianShu + 1
    let chuShiShouYiLv = jiaGe / bean.chuShiJiaGe

    if (bean.zongShouYi > 0) {
      bean.zhengShouYiTianShu = bean.zhengShouYiTianShu + 1
    } else {
      bean.fuShouYiTianShu = bean.fuShouYiTianShu + 1
    }
    if (bean.zuiDaShouYiLv < bean.shouYiLv) {
      bean.zuiDaShouYiLv = bean.shouYiLv
    }
    if (bean.zuiXiaoShouYiLv > bean.shouYiLv) {
      bean.zuiXiaoShouYiLv = bean.shouYiLv
    }
    if (bean.zuiDaShouYiJinE < bean.zongShouYi) {
      bean.zuiDaShouYiJinE = bean.zongShouYi
    }
    if (bean.zuiXiaoShouYiJinE > bean.zongShouYi) {
      bean.zuiXiaoShouYiJinE = bean.zongShouYi
    }

    if (chuShiShouYiLv < Reckoner.maiRuBiLi[bean.maiRuCengShu-1]) { //买入
      let caoZuo = new CaoZuoBean()
      caoZuo.maiRu = true
      caoZuo.jinE = Reckoner.chuShiJinE * Math.pow(2, bean.maiRuCengShu)
      caoZuo.fenShu = caoZuo.jinE / jiaGe
      caoZuo.date = riQi
      bean.caoZuoLieBiao.add(caoZuo)
      bean.maiRuCengShu = bean.maiRuCengShu + 1
      bean.zongJinE = bean.zongJinE + caoZuo.jinE
      bean.zongFenShu = bean.zongFenShu + caoZuo.fenShu
      bean.maiRuChengBen = bean.zongJinE / bean.zongFenShu
      bean.meiRiYuE[bean.meiRiYuE.length-1] = bean.meiRiYuE[bean.meiRiYuE.length-1] + caoZuo.jinE
      // LogUtil.info(DateUtil.getFormatDate(riQi) + ":买入结果:" + JSON.stringify(bean))
    } else if (jiaGe / bean.maiRuChengBen > Reckoner.maiChuBiLi) { //卖出
      let caoZuo = new CaoZuoBean()
      caoZuo.maiRu = false
      caoZuo.jinE = bean.zongJinE
      caoZuo.fenShu = bean.zongFenShu
      caoZuo.date = riQi
      bean.caoZuoLieBiao.add(caoZuo)
      // LogUtil.info(DateUtil.getFormatDate(riQi) + ":卖出结果:" + JSON.stringify(bean))
      return true
    }


    // LogUtil.info(DateUtil.getFormatDate(riQi) + ":每日结果:" + JSON.stringify(bean))
    return false
  }
}

export class TouZiBean {
  public maiRuCengShu: number = 0
  public chuShiJiaGe: number = 0
  public chuShiRiQi: number = 0
  public maiRuChengBen: number = 0
  public zongFenShu: number = 0
  public zongJinE: number = 0
  public zongShouYi: number = 0
  public shouYiLv: number = 0
  public touZiTianShu: number = 0
  public zhengShouYiTianShu = 0
  public fuShouYiTianShu = 0
  public zuiDaShouYiLv = 0
  public zuiDaShouYiJinE = 0
  public zuiXiaoShouYiJinE = 0
  public zuiXiaoShouYiLv = 0
  public meiRiShouYi: ArrayList<number> = new ArrayList()
  public meiRiShouYiLv: ArrayList<number> = new ArrayList()
  public meiRiYuE: ArrayList<number> = new ArrayList()
  public meiRiFenShu: ArrayList<number> = new ArrayList()
  public benJin: ArrayList<number> = new ArrayList()
  public caoZuoLieBiao: ArrayList<CaoZuoBean> = new ArrayList()
}

export class CaoZuoBean {
  public maiRu: boolean = false
  public jinE: number = 0
  public fenShu: number = 0
  public date: number = 0
  public cengShu: number = 0
}


