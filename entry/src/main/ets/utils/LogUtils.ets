import { LogUtil } from "@pura/harmony-utils"

export class LogUtils {
  private static split = 200

  public static info(output: string) {

    if (output.length > LogUtils.split) {
      let start = 0
      for (let i = 0; i < output.length / LogUtils.split + 1; i++) {
        if (start + LogUtils.split < output.length) {
          LogUtil.info(output.substring(start, start + LogUtils.split))
        } else {
          LogUtil.info(output.substring(start, output.length))
        }
        start += LogUtils.split
      }
    } else {
      LogUtil.info(output)
    }
  }
}