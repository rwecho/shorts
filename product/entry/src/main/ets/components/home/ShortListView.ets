import { ShortListViewModel } from "./ShortListViewModel";
import { BusinessError } from '@kit.BasicServicesKit';
import { ShortItem } from "../../model/short";
import { FlowItemNode,flowItemBuilder, ViewItem } from "reusablepool";

const REUSE_VIEW_TYPE_ITEM: string = 'reuse_type_';

// 瀑布流子组件WrappedBuilder对象
let flowItemWrapper: WrappedBuilder<ESObject> = wrapBuilder<ESObject>(flowItemBuilder);

@ComponentV2
export struct ShortListView {
  @Require @Param category: string;
  @Local private vm: ShortListViewModel = new ShortListViewModel(this.category);
  scroller: Scroller = new Scroller();


  aboutToAppear() {
    this.vm.load(0)
      .then(() => {
        // load success
      })
      .catch((error: BusinessError) => {
        // handle error
      });
  }

  build() {
    Scroll(this.scroller) {
      Column({
        space: 2
      }) {
        WaterFlow() {
          LazyForEach(this.vm.shorts, (item: ViewItem, index: number) => {
            FlowItem(){
              FlowItemNode({
                type: REUSE_VIEW_TYPE_ITEM,
                item: item,
                itemColor: Color.White,
                builder: flowItemWrapper
              })
            }
            .width($r("app.string.short_list_flow_item_width"))
          }, (item: string)=> item)
        }
        .columnsTemplate("1fr 1fr")
        .columnsGap($r('app.integer.short_list_flow_columns_Gap'))
        .rowsGap($r('app.integer.short_list_flow_rows_Gap'))
        .backgroundColor($r('app.color.short_list_water_flow_background_color'))
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
        .clip(false)
        .padding({ bottom: 0 + 'px' })
        .width($r('app.string.short_list_percent_100'))
        .height($r('app.string.short_list_percent_100'))
        .nestedScroll({
          scrollForward: NestedScrollMode.PARENT_FIRST,
          scrollBackward: NestedScrollMode.SELF_FIRST
        })
        .id("id_custom_reusable_pool_list")
      }
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
    }
    .width($r('app.string.short_list_percent_100'))
    .height($r('app.string.short_list_percent_100'))
    .clip(false)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
  }
}