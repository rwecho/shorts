import { ActionItem } from "../model/model"
import { ActionSectionView } from "../view/ActionSectionView"

@Component
export struct SecuritySettingView {
  private securitySectionActionItems: ActionItem[] = [
    {
      title: "密码设置",
      subTitle: "修改登录密码",
    },
    {
      title: "指纹设置",
      subTitle: "启用或禁用指纹登录",
    },
    {
      title: "面部识别",
      subTitle: "启用或禁用面部识别登录",
    }
  ]

  build() {

    ActionSectionView({
      actionItems: this.securitySectionActionItems
    }).width("100%")
      .padding({
        left: 16,
        right: 16,
        top: 8
      })
  }
}