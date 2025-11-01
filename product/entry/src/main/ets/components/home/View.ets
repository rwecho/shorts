import { ShortListView } from "./ShortListView";
import { HomeViewModel } from "./ViewModel";

@ComponentV2
export struct HomeView {
  @Local private vm: HomeViewModel = new HomeViewModel();
  private scrollController: Scroller = new Scroller();
  @Local private tabsIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  build() {
    Column() {
      // 上面分类栏
      Row() {
        Stack() {
          // category menu
          List({ scroller: this.scrollController }) {
            ForEach(this.vm.shortCategories, (item: string, index) => {
              ListItem() {
                this.tabBuilder(index, item)
              }
            })
          }
          .id("home_top_category_list")
          .margin({ top: $r("app.integer.home_top_category_list_margin_top") })
          .height($r("app.integer.home_top_category_list_height"))
          .listDirection(Axis.Horizontal)
          // .padding({
          //   right: $r("app.integer.home_top_category_list_padding_right"),
          // })
          .scrollBar(BarState.Off)

          // // search menu 暂时没有搜索框
          // Row() {
          //   // 搜索框背景
          //   Row() {
          //     Image($r("app.media.home_search_icon"))
          //       .id("home_search_icon")
          //       .width($r("app.integer.home_search_icon_size"))
          //   }
          //   .id("home_search_box")
          //   .justifyContent(FlexAlign.Center)
          //   .width($r("app.integer.home_search_box_width"))
          //   .height($r("app.integer.home_search_box_height"))
          //   .borderRadius($r("app.integer.home_search_box_border_radius"))
          //   .backgroundColor($r("app.color.home_search_box_bg_color"))
          //
          // }
          // .linearGradient({
          //   angle: 90,
          //   colors: [['rgba(241, 241, 241, 0)', 0], ['#F1F3F5', 0.2], ['#F1F3F5', 1]]
          // })
          // .justifyContent(FlexAlign.End)
          // .width($r("app.integer.home_search_button_width"))
          // .height($r("app.integer.home_search_button_height"))
        }
        .alignContent(Alignment.TopEnd)
      }
      .backgroundColor($r("app.color.primary_color"))
      .padding({
        left: $r("app.integer.home_top_category_padding_lr"),
        right: $r("app.integer.home_top_category_padding_lr"),
      })
      .margin({
        bottom: $r("app.integer.home_top_category_margin_bottom"),
      })

      // tabs
      Tabs({
        controller: this.tabsController,
      }) {
        ForEach(this.vm.shortCategories, (item: string, index) => {
          TabContent() {
            ShortListView({
              category: item,
            })
          }
        })
      }
      .margin({
        top: $r("app.integer.home_tabs_margin_top"),
      })
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
      // .padding({
      //     left: $r("app.integer.home_tabs_padding_lr"),
      //     right: $r("app.integer.home_tabs_padding_lr"),
      // })
      .height("100%")
      .barWidth(0)
      .barHeight(0)
      .onAnimationStart((index: number, targetIndex: number) => {
        this.tabsIndex = targetIndex;
        this.scrollController.scrollToIndex(targetIndex, true, ScrollAlign.START);
      })
    }
    .height('100%')
    .backgroundColor("#F1F1F1")
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
  }

  @Builder
  tabBuilder(index: number, item: string) {
    Stack() {
      // // background
      // Column() {

      // }
      //     .id("home_top_category_item_bg_" + index)
      //     .width($r("app.integer.home_top_category_item_width"))
      //     .height($r("app.integer.home_top_category_item_height"))
      //     .backgroundColor(
      //         this.tabsIndex === index
      //             ? $r("app.color.home_top_category_item_active_bg_color")
      //             : $r("app.color.home_top_category_item_bg_color")
      //     )
      //     .align(Alignment.End)
      //     .borderRadius($r("app.integer.home_top_category_item_border_radius"));

      // text
      Text(item)
        .id("home_top_category_item_text_" + index)
        .fontSize($r("app.string.home_top_category_item_text_size"))
        .fontColor(this.tabsIndex === index
          ? $r("app.color.home_top_category_item_text_active_color")
          : $r("app.color.home_top_category_item_text_color"))
        .fontWeight(FontWeight.Medium)
        .lineHeight($r("app.integer.home_top_category_item_text_line_height"))
        .margin({
          top: $r("app.integer.home_top_category_item_text_margin_top"),
          bottom: $r("app.integer.home_top_category_item_text_margin_bottom"),
          left: $r("app.integer.home_top_category_item_text_padding_lr"),
          right: $r("app.integer.home_top_category_item_text_padding_lr"),
        })
    }
    .align(Alignment.Center)
    .onClick(() => {
      this.tabsIndex = index;
      this.tabsController.changeIndex(index);
    })
  }
}