import { FooterState, HomePageViewModel } from "./HomePageViewModel";
import { ShortWaterFlowView } from "./ShortWaterFlowView";

@ComponentV2
export struct HomePage { 
  private vm: HomePageViewModel = new HomePageViewModel();
  private scroller: Scroller = new Scroller();
  private categoryScroller: Scroller = new Scroller();
  private categoryTabsController: TabsController = new TabsController();
  @Local private categoryIndex: number = 0;
  @Local isRefreshing: boolean = false;

  aboutToAppear(): void {
    this.vm.load(0);
    this.vm.setItemSizeArray();
  }

  @Builder
  categoryBuilder(index: number, item: string) {
    Stack() {
      // text
      Text(item)
        .id("home_top_category_item_text_" + index)
        .fontSize($r("app.string.home_top_category_item_text_size"))
        .fontColor(this.categoryIndex === index
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
      this.categoryIndex = index;
      this.categoryTabsController.changeIndex(index);
    })
  }

  build() {
    Column({ space: 2 }) {
      // 上面分类栏
      Row() {
        Stack() {
          // category menu
          List({ scroller: this.categoryScroller }) {
            ForEach(this.vm.shortCategories, (item: string, index) => {
              ListItem() {
                this.categoryBuilder(index, item)
              }
            })
          }
          .id("home_top_category_list")
          .margin({ top: $r("app.integer.home_top_category_list_margin_top") })
          .height($r("app.integer.home_top_category_list_height"))
          .listDirection(Axis.Horizontal)
          .scrollBar(BarState.Off)
        }
        .alignContent(Alignment.TopEnd)
      }
      .backgroundColor($r("app.color.primary_color"))
      .padding({
        left: $r("app.integer.home_top_category_padding_lr"),
        right: $r("app.integer.home_top_category_padding_lr"),
      })

      // tabs
      Tabs({
        controller: this.categoryTabsController,
      }) {
        ForEach(this.vm.shortCategories, (item: string, index) => {
          TabContent() {
            ShortWaterFlowView({
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
        this.categoryIndex = targetIndex;
        this.categoryScroller.scrollToIndex(targetIndex, true, ScrollAlign.START);
      })
      .height('100%')
      .backgroundColor("#F1F1F1")
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])


    }
    .height('100%')
    .backgroundColor("#F1F1F1")
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
    .width("100%")
  }
}