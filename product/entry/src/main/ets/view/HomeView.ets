import { ShortItem } from "../model/model"
import { ProductInfo, waterFlowData, WaterFlowDataSource } from "../viewmodel/HomeTabViewModel"

/**
 * 瀑布流容器里的图片+文字混合元素
 * TODO:知识点：@Reusable标识自定义组件具备可复用的能力，它可以被添加到任意的自定义组件上。
 */
@Reusable
@Component
  struct ReusableFlowItem {
  @State listData: ProductInfo =
    new ProductInfo(1, '', '', '');

  // 从复用缓存中加入到组件树之前调用，可在此处更新组件的状态变量以展示正确的内容
  aboutToReuse(params: Record<string, ProductInfo>) {
    this.listData = params.listData as ProductInfo
  }

  build() {
    Column() {
      Image(this.listData.imageSrc)
        .objectFit(ImageFit.Contain)
        .width("100%")

      Text(this.listData.name)
        .height(16)
        .fontSize(12)
        .fontColor("#000")
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.None })
        .margin({
          left: 10,
          top: 6,
          bottom: 6
        })

      Text(this.listData.description)
        .height(10)
        .fontSize(8)
        .fontColor("#a6a6a6")
        .lineHeight(10)
        .margin({
          left: 10,
          bottom: 6
        })
    }
    .width("100%")
      .borderRadius(10)
      .shadow(ShadowStyle.OUTER_DEFAULT_SM)
      .id(this.listData.id.toString())
      .alignItems(HorizontalAlign.Start)
      .margin({
        bottom: 15
      })
  }
}


/**
 * 瀑布流容器里的图片元素
 * TODO:知识点：@Reusable标识自定义组件具备可复用的能力，它可以被添加到任意的自定义组件上。
 */
@Reusable
@Component
  struct ReusableImageItem {
  @State listData: ProductInfo =
    new ProductInfo(1, '', '', '');

  // 从复用缓存中加入到组件树之前调用，可在此处更新组件的状态变量以展示正确的内容
  aboutToReuse(params: Record<string, ProductInfo>) {
    this.listData = params.listData as ProductInfo
  }

  build() {
    Column() {
      Image(this.listData.imageSrc)
        .id(this.listData.id.toString())
        .width("100%")
        .borderRadius(6)
    }
  }
}

@Component
export struct HomeView {
  @State dataSource: WaterFlowDataSource = new WaterFlowDataSource(waterFlowData);
  // 瀑布流分组信息
  @State sections: WaterFlowSections = new WaterFlowSections();

  // 瀑布流数据个数
  dataCount: number = waterFlowData.length;
  // 双列时，图片较小的瀑布流子组件高度
  private shortDisplayHeight: number = 155;
  // 双列时，图片较大的瀑布流子组件高度
  private highDisplayHeight: number = 256;
  // 瀑布流容器里的图片元素组件的复用id和type
  private imageFlowItemReuseId: string = 'onlyImage';
  // 瀑布流容器里的图片混合文字元素组件的复用id和type
  private reusableFlowItemReuseId: string = 'imageMixText';
  // 瀑布流容器里底部最后一个元素的type
  private bottomFlowItem: string = 'bottomImageMixText';
  // 瀑布流滚动控制器
  private scroller: Scroller = new Scroller();
  // 分组的margin信息
  private sectionMargin: Margin = {
    left: 4,
    bottom: 15,
    right: 4
  }
  // 瀑布流是一列的时候，分组配置信息
  private oneColumnSection: SectionOptions = {
    // 分组中FlowItem数量
    itemsCount: 1,
    // 列数
    crossCount: 1,
    // 分组的列间距
    columnsGap: 5,
    // 分组的行间距
    rowsGap: 0,
    // 分组的margin
    margin: this.sectionMargin,
    // FlowItem的高度
    onGetItemMainSizeByIndex: (index: number) => {
      // 如果是最后一个item，高度赋值200
      if (index === this.dataCount - 1) {
        return 200
      }
      return 160
    }
  };
  // 瀑布流是两列的时候，分组配置信息
  private twoColumnSection: SectionOptions = {
    itemsCount: 8,
    crossCount: 2,
    columnsGap: 8,
    rowsGap: 0,
    onGetItemMainSizeByIndex: (index: number) => {
      // 瀑布流数据中最大的index是9的倍数，通过index除9的余数可以确定哪些item的高度较矮
      const newIndex = index % 9
      // index除9的余数在以下数组中的的，高度较矮
      const longIndexArr = [1, 4, 5, 8]
      return longIndexArr.includes(newIndex) ? this.shortDisplayHeight : this.highDisplayHeight
    }
  }

  private makeTwoColumnSection(count: number): SectionOptions {
    return {
      itemsCount: count,
      crossCount: 2,
      columnsGap: 8,
      rowsGap: 0,
      // 高度规则按分组内索引决定，适配任意 count
      onGetItemMainSizeByIndex: (idx: number) => {
        // 例：每 3 个里第 2 个做“矮卡”
        return (idx % 3 === 1) ? this.shortDisplayHeight : this.highDisplayHeight
      }
    }
  }
  aboutToAppear() {
    let sectionOptions: SectionOptions[] = []
    let i = 0
    while (i < waterFlowData.length) {
      const item = waterFlowData[i]
      if (item.type === this.reusableFlowItemReuseId) {
        // 统计连续的 imageMixText 数量
        let run = 0
        while (i + run < waterFlowData.length && waterFlowData[i + run].type === this.reusableFlowItemReuseId) {
          run++
        }
        sectionOptions.push(this.makeTwoColumnSection(run))
        i += run // 跳过这一段
      } else {
        // onlyImage 或 bottomImageMixText 走单列分组
        sectionOptions.push(this.oneColumnSection)
        i += 1
      }
    }
    // 展开插入，确保总 itemsCount 之和 == 数据总数
    this.sections.splice(0, 0, sectionOptions)
  }

  /**
   * 瀑布流中底部的最后一个元素
   * @param listData 图片信息
   */
  @Builder
  bottomItemInWaterFlow(listData: ProductInfo) {
    Column() {
      Image(listData.imageSrc)
        .id(listData.id.toString())
        .width("100%")
      Text("HUAWEI—构造万物互联的智能世界")
        .height(22)
        .textAlign(TextAlign.Center)
        .fontSize(22)
        .margin({ top: 8 })
      Text("致力于把数字世界带入每个人、每个家庭、每个组织,构建万物互联的智能世界")
        .height(15)
        .fontColor("#a6a6a6")
        .fontSize(8)
        .margin({ bottom: 8 })
    }
    .shadow(ShadowStyle.OUTER_DEFAULT_SM)
      .borderRadius(10)
  }

  @Builder
  build() {
    Column() {
      WaterFlow({ scroller: this.scroller, sections: this.sections }) {
        LazyForEach(this.dataSource, (item: ProductInfo) => {
          FlowItem() {
            // 通过type字段区分需要展示的ux
            if (item.type === this.reusableFlowItemReuseId) {
              ReusableFlowItem({ listData: item })
                .reuseId(this.reusableFlowItemReuseId)
            } else if (item.type === this.imageFlowItemReuseId) {
              ReusableImageItem({ listData: item })
                .reuseId(this.imageFlowItemReuseId)
            } else {
              this.bottomItemInWaterFlow(item)
            }
          }
          .width("100%")
        }, (item: ProductInfo) => JSON.stringify(item))
      }
      .cachedCount(5)
        .width("100%")
        .height("100%")
        .padding({
          left: 12,
          right: 12
        })
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
        .clip(false)
    }
    .width("100%")
      .height("100%")
      .clip(true)
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
  }
}