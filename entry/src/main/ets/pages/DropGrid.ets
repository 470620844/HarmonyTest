
import { hilog } from '@kit.PerformanceAnalysisKit';
import { LogUtil } from '@pura/harmony-utils';

@Entry
@Component
struct DropGrid {
  @State numbers: Array<number> = [1,2,3,4,5,6,7,8,9,10]

  @Builder
  itemLayout(text: string) {
    Text(text)
      .fontSize(16)
      .backgroundColor(Color.Pink)
      .width(80)
      .height(80)
      .textAlign(TextAlign.Center)
  }

  changeIndex(itemIndex: number, insertIndex: number) { //交换数组位置
    let temp = this.numbers[itemIndex]
    if(itemIndex>insertIndex){
      for (let index = itemIndex; index > insertIndex; index--) {
        LogUtil.info(index+":"+this.numbers[index]+"-----"+(index-1)+":"+this.numbers[index-1])
        this.numbers[index] = this.numbers[index-1]
      }
      this.numbers[insertIndex] = temp

    }else if (itemIndex<insertIndex){
      for (let index = itemIndex; index < insertIndex; index++) {
        LogUtil.info(index+":"+this.numbers[index]+"-----"+(index-1)+":"+this.numbers[index-1])
        this.numbers[index] = this.numbers[index+1]
      }
      this.numbers[insertIndex] = temp
    }

    for (let index = 0; index < this.numbers.length; index++) {
      LogUtil.info("number:"+this.numbers[index])
    }

  }

  build() {
    Column() {
      Grid() {
        ForEach(this.numbers, (n: number) => {
          GridItem() {
            this.itemLayout(n.toString())
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .editMode(true) //设置Grid是否进入编辑模式
      .supportAnimation(true)
      .onItemDragStart((event: ItemDragInfo, itemIndex: number) => { //第一次拖拽此事件绑定的组件时，触发回调。
        return this.itemLayout(this.numbers[itemIndex].toString()) //设置拖拽过程中显示
      })
      .onItemDrop((event: ItemDragInfo, itemIndex: number, insertIndex: number,
        isSuccess: boolean) => {
        LogUtil.info("index1:"+itemIndex+"----insertIndex-"+insertIndex)
        if (!isSuccess || insertIndex >= this.numbers.length) {
          return
        }
        this.changeIndex(itemIndex, insertIndex)
      })
    }.width('100%')
    .height("100%")
  }
}
