import { LogUtil } from '@pura/harmony-utils';
import { MessageEvents, worker } from '@kit.ArkTS';

const worker1: worker.ThreadWorker = new worker.ThreadWorker('entry/ets/workers/WorkerTest.ets')

@Entry
@Component
struct AxiosTest {
  build() {
    Scroll() {
      Column() {
        Button('执行任务')
          .width('100%')
          .height(60)
          .margin({ top: 20 })
          .onClick(
            () => {
              LogUtil.info("POST注册请求 onclick")


              worker1.onmessage = (e: MessageEvents) => {
                LogUtil.info("onmessage", e.data)


              }
              worker1.postMessage("start")
            }
          )
        Button('停止任务')
          .width('100%')
          .height(60)
          .margin({ top: 20 })
          .onClick(
            () => {
              LogUtil.info("POST注册请求 onclick")


              worker1.onmessage = (e: MessageEvents) => {
                LogUtil.info("onmessage", e.data)


              }
              worker1.postMessage("stop")
            }
          )
        Button('销毁任务')
          .width('100%')
          .height(60)
          .margin({ top: 20 })
          .onClick(
            () => {
              LogUtil.info("POST注册请求 onclick")
              worker1.off("")
            }
          )

      }.width('100%')
      .height('auto')
      .justifyContent(FlexAlign.Start)
      .backgroundColor('#00ff00')
    }.width('100%')
    .height('auto')
    .backgroundColor("#ff00ff")

  }
}