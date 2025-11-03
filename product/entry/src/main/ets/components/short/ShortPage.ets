import { ShortPageViewModel } from "./ShortPageViewModel";
import { ImageView } from "../image/ImageView";

@Builder
export function ShortPageBuilder(name: string, param: object) {
  ShortPage({
    shortId: "hello world"
  })
}


@ComponentV2
export struct ShortPage {
  @Require @Param shortId: string;
  private vm: ShortPageViewModel = new ShortPageViewModel(this.shortId);

  aboutToAppear(): void {
    this.vm.load()
  }

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          // 上部分：展示 short 的信息
          Column({ space: 12 }) {
            // 封面图片
            if (this.vm.item?.cover) {
              ImageView({
                url: this.vm.item.cover,
                imageRadius: 8
              })
            }

            // 标题
            if (this.vm.item?.title) {
              Text(this.vm.item.title)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')
                .width('100%')
                .textAlign(TextAlign.Start)
            }

            // 作者和时间信息
            Row({ space: 16 }) {
              if (this.vm.item?.author) {
                Text(this.vm.item.author)
                  .fontSize(14)
                  .fontColor('#666666')
              }
              if (this.vm.item?.createTime) {
                Text(this.vm.item.createTime)
                  .fontSize(12)
                  .fontColor('#999999')
              }
              if (this.vm.item?.duration) {
                Text(this.vm.item.duration)
                  .fontSize(12)
                  .fontColor('#999999')
              }
            }
            .width('100%')

            // 标签
            if (this.vm.item?.tags && this.vm.item.tags.length > 0) {
              Row({ space: 8 }) {
                ForEach(this.vm.item.tags, (tag: string) => {
                  Text(tag)
                    .fontSize(12)
                    .fontColor('#007DFF')
                    .padding({
                      left: 8,
                      right: 8,
                      top: 4,
                      bottom: 4
                    })
                    .backgroundColor('#E6F2FF')
                    .borderRadius(4)
                })
              }
              .width('100%')
            }
          }
          .padding(16)
          .width('100%')

          // 分割线
          Divider()
            .color('#E5E5E5')
            .strokeWidth(1)

          // 下部分：展示脚本内容
          Column() {
            Text('脚本内容')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor('#333333')
              .width('100%')
              .margin({ bottom: 12 })

            if (this.vm.item?.description) {
              Text(this.vm.item.description)
                .fontSize(14)
                .fontColor('#666666')
                .lineHeight(22)
                .width('100%')
            } else {
              Text('暂无脚本内容')
                .fontSize(14)
                .fontColor('#999999')
                .width('100%')
            }
          }
          .padding(16)
          .width('100%')
        }
        .width('100%')
      }
      .scrollBar(BarState.Off)
    }
    .title('Short详情')
  }
}

