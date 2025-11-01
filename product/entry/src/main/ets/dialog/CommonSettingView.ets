import { ActionItem } from "../model/model"
import { ActionSectionView } from "../view/ActionSectionView"

@Component
export struct CommonSettingView {
  private firstSectionActionItems: ActionItem[] = [
    {
      title: "测试1",
      subTitle: "测试1的子标题",
    },
    {
      title: "测试2",
      subTitle: "测试2的子标题",
    },
    {
      title: "测试3",
      subTitle: "测试3的子标题",
    }
  ]
  private secondSectionActionItems: ActionItem[] = [
    {
      title: "测试4",
      subTitle: "测试4的子标题",
    },
    {
      title: "测试5",
      subTitle: "测试5的子标题",
    },
    {
      title: "测试6",
      subTitle: "测试6的子标题",
    }
  ]
  private thirdSectionActionItems: ActionItem[] = [
    {
      title: "测试7",
      subTitle: "测试7的子标题",
    },
    {
      title: "测试8",
      subTitle: "测试8的子标题",
    },
    {
      title: "测试9",
      subTitle: "测试9的子标题",
    }
  ]
  private fourthSectionActionItems: ActionItem[] = [{
    title: "测试10",
    subTitle: "测试10的子标题",
  }, {
    title: "测试11",
    subTitle: "测试11的子标题",
  }, {
    title: "测试12",
    subTitle: "测试12的子标题",
  }
  ]

  build() {
    Column(){
      ActionSectionView({
        actionItems: this.firstSectionActionItems
      })

      ActionSectionView({
        actionItems: this.secondSectionActionItems
      })
        .margin({
          top: 20
        })

      ActionSectionView({
        actionItems: this.thirdSectionActionItems
      })
        .margin({
          top: 20
        })

      ActionSectionView({
        actionItems: this.fourthSectionActionItems
      })
        .margin({
          top: 20
        })


    }.width("100%")
      .padding({
        left: 16,
        right: 16,
        top: 8
      })
  }
}