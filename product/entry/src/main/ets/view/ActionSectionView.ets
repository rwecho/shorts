import { ActionItem } from '../model/model'
import { promptAction } from '@kit.ArkUI'

@Component
export struct ActionSectionView {
  actionItems: ActionItem[] = []

  build() {
    Column() {
      ForEach(this.actionItems, (actionItem: ActionItem, index: number) => {

        this.createActionItem(actionItem)
        if (index < this.actionItems.length - 1) {
          this.createDivider()
        }
      })
    }.sectionStyle()
  }

  @Builder
  createActionItem(actionItem: ActionItem) {

    Row() {
      Text(actionItem.title)
        .fontSize(15)
        .fontColor(Color.Black)

      Text(actionItem.subTitle)
        .fontSize(11)
        .fontColor(Color.Gray)
        .margin({
          left: 8
        })

      Blank()

      SymbolGlyph($r("sys.symbol.arrow_right"))
        .width(24)
        .height(24)
    }
    .alignItems(VerticalAlign.Center)
      .width("100%")
      .height(50)
      .onClick(() => {
        actionItem.onClick && actionItem.onClick()
      })
  }

  @Builder
  createDivider() {
    Divider()
      .vertical(false)
      .strokeWidth(0.5)
      .color("F5F5F5")
  }

  /**
   * section的样式
   */
  @Styles
  sectionStyle() {
    .width("100%")
      .backgroundColor(Color.White)
      .borderRadius(16)
      .padding({
        left: 16,
        right: 16
      })
  }
}