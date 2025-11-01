import { NodeItem, NodePool } from "../model/NodePool";
import { ViewItem } from "../model/ViewItem";

@Builder
export function flowItemBuilder(data: ESObject) {
  SubFlowItem({
    data: data.data,
    itemColor: data.itemColor
  })
}


// 自定义组件复用池瀑布流子组件
@Component
export struct FlowItemNode {
  @State type: string = '';
  @State item: ViewItem = new ViewItem();
  @State itemHeight: number = 0;
  @State itemColor: Color = 0;
  @State builder: WrappedBuilder<ESObject> | null = null;
  private nodeItem: NodeItem = new NodeItem();

  aboutToAppear(): void {
    this.nodeItem = NodePool.getInstance().getNode(this.type, this.item, this.itemColor, this.builder!)!;
  }

  aboutToRecycle(): void {
    this.nodeItem?.node?.recycle();
  }

  aboutToReuse(params: ESObject): void {
    this.nodeItem?.node?.reuse(params);
  }

  build() {
    NodeContainer(this.nodeItem)
  }
}

@Component
export struct SubFlowItem {
  @Prop data: ViewItem;
  @Prop itemColor: Color = 0;

  aboutToReuse(params: ESObject): void {
    this.data = params.data;
    this.itemColor = params.itemColor;
  }

  build() {
    Column() {
      Image(this.data.image)
      // .width($r('app.string.reusablepool_percent_100'))
        .objectFit(ImageFit.Auto)
        .width("100%")
        .borderRadius({
          topLeft: $r('app.integer.reusablepool_flow_item_comp_border_radius'),
          topRight: $r('app.integer.reusablepool_flow_item_comp_border_radius')
        })
      Text(this.data.name)
        .fontSize($r('app.string.reusablepool_flow_item_comp_name_font_size'))
        .fontColor(Color.Black)
        .margin({
          top: $r('app.integer.reusablepool_item_name_margin_top')
        })
      Text(this.data.des)
        .fontSize($r('app.string.reusablepool_flow_item_comp_des_font_size'))
        .fontColor(Color.Grey)
    }
    .borderRadius($r('app.integer.reusablepool_flow_item_comp_border_radius'))
    .backgroundColor(this.itemColor)
  }
}