import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { LogUtil } from '@pura/harmony-utils';
import { DialogHelper } from '@pura/harmony-dialog';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    LogUtil.init(0x1010, 'hfTestTag', true)
    this.initDialog()
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/AxiosTest', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

   initDialog(){
     DialogHelper.setDefaultConfig((config) => {
       config.uiContext = this.context  //必须初始化上下文
       config.autoCancel = true; //点击遮障层时，是否关闭弹窗，true表示关闭弹窗。false表示不关闭弹窗。默认值：true
       config.backCancel = true; //点击返回键或手势返回时，是否关闭弹窗；实现onWillDismiss函数时，该参数不起作用。true表示关闭弹窗。false表示不关闭弹窗。默认值：true。
       config.actionCancel = true; //点击操作按钮时，是否关闭弹窗。false表示不关闭弹窗。默认值：true。
       config.alignment = DialogAlignment.Center; //弹窗的对齐方式。
       config.offset = { dx: 0, dy: 0 }; //弹窗相对alignment所在位置的偏移量。默认值：{ dx: 0, dy: 0 }
       config.maskColor = 0x33000000; //自定义蒙层颜色。默认值 0x33000000
       config.backgroundColor = Color.White; //弹窗背板颜色。默认值：Color.White
       config.backgroundBlurStyle = BlurStyle.COMPONENT_ULTRA_THICK; //弹窗背板模糊材质。默认值：BlurStyle.COMPONENT_ULTRA_THICK
       config.cornerRadius = 20; //设置背板的圆角半径。可分别设置4个圆角的半径。

       config.title = '温馨提示'; //弹框标题
       config.primaryButton = '取消'; //弹框左侧按钮。
       config.secondaryButton = '确定'; //弹框右侧按钮。
       config.imageRes = undefined; //TipsDialog用到，展示的图片。
       config.imageSize = { width: '64vp', height: '64vp' }; //TipsDialog用到，自定义图片尺寸。默认值：64*64vp

       config.loading_loadSize = 60; //加载动画或进度条的大小
       config.loading_loadColor = Color.White; //加载动画或进度条的颜色
       config.loading_content = ''; //加载动画的提示文字
       config.loading_fontSize = 16; //文字大小
       config.loading_fontColor = Color.White; //文字颜色
       config.loading_backgroundColor = '#CC000000'; //背景颜色，八位色值前两位为透明度
       config.loading_borderRadius = 10; //背景圆角

       config.toast_fontSize = 16; //文字大小
       config.toast_fontColor = Color.White; //文字颜色
       config.toast_backgroundColor = '#CC000000'; //背景颜色，建议八位色值前两位为透明度
       config.toast_borderRadius = 8; //背景圆角
       config.toast_padding = { left: 16, right: 16, top: 12, bottom: 12 }; //Padding
       config.toast_imageSize = { width: 45, height: 45 }; //Tip图片尺寸。默认值：45*45vp
       config.toast_duration = 2000; //显示时长(1500ms-10000ms)
       config.toast_durationLong = 10000; //显示时长(10000ms)
     });

  }
}
