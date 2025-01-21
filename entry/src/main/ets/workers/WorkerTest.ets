import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { LogUtil } from '@pura/harmony-utils';
import { hilog } from '@kit.PerformanceAnalysisKit';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = (e: MessageEvents) => {
  workerPort.postMessage(e.data)
  let run = false
  if(e.data == 'start'){
    run = true
  }
  if(e.data == 'stop'){
    run = false

  }
  let num =1000
  while (run && num>0){
    LogUtil.info("run job "+num)
    num--
  }

}

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessageerror = (e: MessageEvents) => {
  LogUtil.info("workerPort onmessageerror",e.data)
}

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param e error message
 */
workerPort.onerror = (e: ErrorEvent) => {
  LogUtil.info("workerPort onerror",e.message)
}