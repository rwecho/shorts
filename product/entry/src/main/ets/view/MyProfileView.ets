import { promptAction } from "@kit.ArkUI"
import { CommonSettingView } from "../dialog/CommonSettingView"
import { LimitedHeightBottomDialog } from "../dialog/LimitedHeightBottomDialog"
import { SecuritySettingView } from "../dialog/SecuritySettingView"
import { MyProfileViewModel } from "../viewmodel/MyProfileViewModel"
import { ActionSectionView } from "./ActionSectionView"
import router from '@ohos.router';

const DIALOG_MAX_SCROLL_HEIGHT = 600 // 弹窗可滚动区域最大高度

/**
 * 创建常用设置底部弹窗视图
 */
@Builder
function createCommonSettingView() {
  CommonSettingView()
}

/**
 * 创建安全设置底部弹窗视图
 */
@Builder
function createSecuritySettingView() {
  SecuritySettingView()
}

@Component
export struct MyProfileView {
  private viewModel = new MyProfileViewModel()
  // 常用设置底部弹窗是否显示标记，与LimitedHeightBottomDialog中的showFlag双向绑定，用于底部弹窗出现与消失时的动效处理
  @State commonSettingDialogShowFlag: Visibility = Visibility.Visible;
  // 安全设置底部弹窗是否显示标记，与LimitedHeightBottomDialog中的showFlag双向绑定，用于底部弹窗出现与消失时的动效处理
  @State securitySettingDialogShowFlag: Visibility = Visibility.Visible;
  // 常用设置底部弹窗的CustomDialogController
  commonSettingDialogController: CustomDialogController = new CustomDialogController({
    builder: LimitedHeightBottomDialog({
      title: "常用设置",
      maxScrollHeight: DIALOG_MAX_SCROLL_HEIGHT,
      wrapBuilder: wrapBuilder(createCommonSettingView),
      showFlag: this.commonSettingDialogShowFlag
    }),
    alignment: DialogAlignment.Bottom,
    width: "100%",
    customStyle: true, // customStyle需要设置为true，否则底部弹窗出现的动效会有问题
    autoCancel: true,
    onWillDismiss: () => { // 修改点击弹窗外部区域和返回操作时弹窗消失的方式，这里的处理会有一个动效。不加这个处理方式的话，弹窗会以默认的方式消失
      this.commonSettingDialogShowFlag = Visibility.Hidden
    }
  });
  // 安全设置底部弹窗的CustomDialogController
  securitySettingDialogController: CustomDialogController = new CustomDialogController({
    builder: LimitedHeightBottomDialog({
      title: "安全设置",
      maxScrollHeight: DIALOG_MAX_SCROLL_HEIGHT,
      wrapBuilder: wrapBuilder(createSecuritySettingView),
      showFlag: this.securitySettingDialogShowFlag
    }),
    alignment: DialogAlignment.Bottom,
    width: "100%",
    customStyle: true,
    autoCancel: true,
    onWillDismiss: () => {
      this.securitySettingDialogShowFlag = Visibility.Hidden
    }
  });

  @Builder
  build() {
    Column() {
      // 头像和昵称
      Row() {
        Image($r("app.media.person"))
          .width(60)
          .height(60)
          .objectFit(ImageFit.Cover)
          .borderRadius(30)

        Text("虚空假面")
          .fontSize(18)
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Bold)
          .margin({
            left: 16
          })
      }.width("100%")
      .alignItems(VerticalAlign.Center)
      .onClick(() => {
        promptAction.openToast({
          message: "正在建设中..."
        })
      })

      ActionSectionView({
        actionItems: this.viewModel.firstSectionItems
      })
        .margin({
          top: 20
        })

      ActionSectionView({
        actionItems: this.viewModel.secondSectionItems
      })
        .margin({
          top: 20
        })


      ActionSectionView({
        actionItems: [
          {
            title: "test",
            subTitle: "test for test",
            onClick: async () => {
              try {
                await this.getUIContext().getRouter().pushUrl({
                  url: "pages/EntryView",
                  params: {
                    data: "hello from my profile"
                  }
                }, router.RouterMode.Standard
                )
              }
              catch(e){
                console.log(e);
              }
            }
          },
          {
            title: "常用设置",
            subTitle: "应用常用功能设置",
            onClick: () => {
              this.commonSettingDialogShowFlag = Visibility.Visible
              this.commonSettingDialogController.open()
            }
          },
          {
            title: "安全设置",
            subTitle: "账户及隐私相关设置",
            onClick: () => {
              this.securitySettingDialogShowFlag = Visibility.Visible
              this.securitySettingDialogController.open()
            }
          }
        ]
      })
        .margin({
          top: 20
        })


      Text("说明：底部弹窗的高度如果达到限制高度，弹窗内部的内容可能无法全部展示，需要滚动查看。如果未达到限制高度，弹窗内部的内容全部展示。")
        .fontSize(11)
        .fontColor(Color.Gray)
        .margin({
          top: 20
        })


    }
    .width("100%")
    .height("100%")
    .padding({
      left: 16,
      right: 16,
      top: 32
    })
    .backgroundColor("#F5F5F5")
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}