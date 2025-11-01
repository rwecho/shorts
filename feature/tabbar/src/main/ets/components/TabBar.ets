import { defaultTabBarItems, TabBarItem } from "../model/TabBarItem"

@Preview
@Component
  struct TabBarPreview {
  build() {
    TabBar({
      tabBarItems: defaultTabBarItems,
      selectedIndex: 0
    })
  }
}

@Component
export struct TabBar {
  @Prop tabBarItems!: TabBarItem[]; // 使用 ! 表示必定有值
  @Prop strongIndex: number = 1;
  @Link selectedIndex: number;
  @State iconOffset: number = 0;

  build() {
    Flex({
      direction: FlexDirection.Row,
      justifyContent: FlexAlign.SpaceAround,
      alignItems: ItemAlign.Center
    }) {
      ForEach(this.tabBarItems, (item: TabBarItem, tabBarIndex: number) => {
        this.tabItemBuilder(tabBarIndex, item)
      }, (item: TabBarItem) => JSON.stringify(item))
    }
  }

  @Builder
  tabItemBuilder(index: number, item: TabBarItem) {
    Column() {
      if (this.strongIndex === index) {
        Image($r(item.icon))
          .id(`tab_button_${index}`)
          .interpolation(ImageInterpolation.High)
          .width($r("app.float.tab_icon_strong_size"))
          .height($r("app.float.tab_icon_strong_size"))
          .scale(this.selectedIndex === index
            ? {
              x: 1.2,
              y: 1.2,
            }
            : {
              x: 1,
              y: 1
            })
          .fillColor($r("app.color.tab_icon_strong"))
          .animation({
            duration: 200,
            delay: 0,
            curve: Curve.Ease,
            playMode: PlayMode.Normal
          })
      } else {
        Image($r(item.icon))
          .id(`tab_button_${index}`)
          .interpolation(ImageInterpolation.High)
          .offset({
            y: this.selectedIndex === index ? this.iconOffset : 0
          })
          .width($r("app.float.tab_icon_size"))
          .height($r("app.float.tab_icon_size"))
          .fillColor(this.selectedIndex === index
            ? $r("app.color.tab_icon_selected")
            : $r("app.color.tab_icon_normal"))
          .animation({
            duration: 200,
            delay: 0,
            curve: Curve.Ease,
            playMode: PlayMode.Normal
          })
      }


      if (item.title) {
        Text($r(item.title))
          .fontSize($r("app.float.tab_text_size"))
          .fontWeight(FontWeight.Medium)
          .fontColor(this.selectedIndex === index
            ? $r("app.color.tab_text_selected")
            : $r("app.color.tab_text_normal"))
      }
    }
    .justifyContent(FlexAlign.Center)
      .width("100%")
      .height(48)
      .onClick(() => {
        this.selectedIndex = index
        this.iconOffset = -3
      })
  }
}
