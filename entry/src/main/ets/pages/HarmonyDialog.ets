import { DialogAction, DialogHelper } from '@pura/harmony-dialog';
import { ToastUtil } from '@pura/harmony-utils';

@Entry
@Component
struct HarmonyDialog {
  private menuArray = ["相机", "相册", "文件管理器"]

  build() {
    Column() {
      this.ButtonStyle("操作确认类弹出框", () => {
        //操作确认类弹出框
        DialogHelper.showAlertDialog({
          content: "确定保存该WPS文件吗？",
          onAction: (action) => {
            if (action == DialogAction.ONE) {
              ToastUtil.showToast(`您点击了取消按钮`);
            } else if (action == DialogAction.TWO) {
              ToastUtil.showToast(`您点击了确认按钮`);
            }
          }
        })

      })
      this.ButtonStyle("信息确认类弹出框", () => {
        //信息确认类弹出框
        DialogHelper.showConfirmDialog({
          checkTips: "是否记住密码？",
          content: "您是否退出当前应用",
          onCheckedChange: (check) => {
            ToastUtil.showToast(`${check}`);
          },
          onAction: (action) => {
            ToastUtil.showToast(`${action}`);
          }
        })

      })

      this.ButtonStyle("提示弹出框", () => {
        //提示弹出框
        DialogHelper.showTipsDialog({
          content: '想要卸载这个APP嘛?',
          onAction: (action) => {
            ToastUtil.showToast(`${action}`);
          }
        })

      })

      this.ButtonStyle("选择类弹出框", () => {
        //选择类弹出框
        DialogHelper.showSelectDialog({
          radioContent: ["文本菜单选项一", "文本菜单选项二", "文本菜单选项三", "文本菜单选项四", "文本菜单选项五"],
          onCheckedChanged: (index) => {
            ToastUtil.showToast(`${index}`);
          },
          onAction: (action, dialogId, value) => {
            ToastUtil.showToast(`${action} --- ${value}`);
          }
        })

      })

      this.ButtonStyle("动作面板", () => {
        //动作面板
        DialogHelper.showBottomSheetDialog({
          title: "请选择上传方式",
          sheets: ["相机", "相册", "文件管理器"],
          onAction: (index) => {
            ToastUtil.showToast(`您点击了，${this.menuArray[index]}`);
          }
        })

      })

    }

  }

  @Builder
  ButtonStyle(title: string, callBack: () => void) {
    Text(title)
      .fontSize(30)
      .fontColor('#00eedd')
      .width("100%")
      .height(60)
      .textAlign(TextAlign.Center)
      .backgroundColor('#ee00ee')
      .onClick(callBack)
      .margin({ bottom: 20 })
  }
}
