import { ShortItem } from "../../model/model";
import { ImageView } from "../image/ImageView";
import { FooterState, ProfileViewModel } from "./ProfilePageViewModel";
import { router } from "router"

@ComponentV2
export struct ProfilePage {
  private vm: ProfileViewModel = new ProfileViewModel();
  private scroller: Scroller = new Scroller();
  @Local isRefreshing: boolean = false;

  aboutToAppear(): void {
    this.vm.load(0);

    this.vm.setItemSizeArray();
  }

  @Builder
  footer() {
    // 注意：不要直接用IfElse节点作为footer的根节点
    // 必须在外面使用(Column/Row/Stack等)容器包裹，确保布局正确
    Column() {
      if (this.vm.footerState == FooterState.Loading) {
        Text(`加载中...`)
          .fontSize(10)
          .backgroundColor(Color.Red)
          .width(50)
          .height(50)
          .align(Alignment.Center)
          .margin({ top: 2 })
      } else if (this.vm.footerState == FooterState.End) {
        Text(`到底啦...`)
          .fontSize(10)
          .backgroundColor(Color.Red)
          .width(50)
          .height(50)
          .align(Alignment.Center)
          .margin({ top: 2 })
      } else {
        Text(`Footer`)
          .fontSize(10)
          .backgroundColor(Color.Red)
          .width(50)
          .height(50)
          .align(Alignment.Center)
          .margin({ top: 2 })
      }
    }

  }

  build() {
    Column({ space: 2 }) {
      Refresh({ refreshing: $$this.isRefreshing }) {

        WaterFlow({
          footer: this.footer(),
          scroller: this.scroller
        }) {
          LazyForEach(this.vm.shorts, (item: ShortItem, index) => {
            FlowItem() {
              Stack() {
                Column() {
                  // 注意：需要确保对应的jpg文件存在才会正常显示
                  ImageView({
                    url: item.cover,
                    imageRadius: {
                      topLeft: 8,
                      topRight: 8
                    }
                  })
                }

                Column() {
                  Row() {
                    if (item.author) {
                      Text(item.author)
                        .fontSize("8fp")
                        .fontWeight(FontWeight.Medium)
                        .alignSelf(ItemAlign.Start)
                    }

                    Text(item.title)
                      .fontSize("10fp")
                      .fontWeight(FontWeight.Bold)
                      .margin({
                        left: 4,
                        right: 4
                      })
                      .maxLines(2)
                      .textOverflow({
                        overflow: TextOverflow.Ellipsis
                      })
                  }
                  .padding({
                    left: 8,
                    right: 8,
                    top: 4,
                    bottom: 4
                  })
                  .width("100%")
                  .backgroundColor("#ffffff")
                  .opacity(0.75)
                }
                .width("100%")
                .height("100%")
                .justifyContent(FlexAlign.End)
              }
            }
            .width('100%')
            .aspectRatio(this.vm.itemHeightArray[index % 100] / this.vm.itemWidthArray[index % 100])
            .onClick(() => {
              const parameters = new Object({
                "hello world": "hello" + " world"
              });
              router.push("shortPage", parameters)
            })
          }, (item: string) => item)
        }
        .columnsTemplate("1fr 1fr") // 设置2列等宽布局
        .columnsGap(8)
        .rowsGap(8)
        .backgroundColor(0xFAEEE0)
        .width('100%')
        .height('100%')
        // 边缘效果：弹簧回弹效果
        .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: true })
        // 触底加载数据：滚动到底部时触发分页加载
        .onReachEnd(() => {
          console.info("onReachEnd")
          // 模拟分页加载：当数据超过200条时停止加载
          if (this.vm.shorts.totalCount() > 500) {
            this.vm.footerState = FooterState.End;
            return;
          }
          setTimeout(() => {
            this.vm.load(this.vm.page + 1);
          }, 1000)
        })
        .onReachStart(() => {
          // 滚动到顶部时触发
          console.info('waterFlow reach start');
        })
        .onScrollStart(() => {
          // 开始滚动时触发
          console.info('waterFlow scroll start');
        })
        .onScrollStop(() => {
          // 停止滚动时触发
          console.info('waterFlow scroll stop');
        })
        .onScrollFrameBegin((offset: number, state: ScrollState) => {
          // 滚动帧开始时触发：可以控制滚动行为
          // offset：滚动偏移量，state：滚动状态
          console.info('waterFlow scrollFrameBegin offset: ' + offset + ' state: ' + state.toString());
          return { offsetRemain: offset }; // 返回开发者期望的实际滚动偏移量
        })
      }
      .onStateChange((refreshStatus: RefreshStatus) => {
        // 刷新状态变化监听：处理不同的刷新状态
        if (refreshStatus === RefreshStatus.Done) {
          // 刷新完成时：调用数据源的刷新方法，更新所有数据
          this.vm.refreshItems();
        }
      })
      .onRefreshing(() => {
        setTimeout(() => {
          this.isRefreshing = false;
        }, 1000)
      })
    }
  }
}