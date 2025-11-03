import { CreateShortView } from '../view/CreateShort/CreateShortView';
import { TabBar, TabBarItem, defaultTabBarItems } from "tabbar"
import { ProfilePage } from '../components/profile/ProfilePage';
import { router } from "router"
import { HomePage } from '../components/home/HomePage';


@Entry
@Component
struct Index {
  private tabsController: TabsController = new TabsController(); // 标签页控制器
  @State currentIndex: number = 0; // 当前选中的标签页索引
  // 暂时保留，应该是保证底部区域留白
  @StorageLink('avoidAreaBottomToModule') avoidAreaBottomToModule: number = 0;

  @Builder
  tabContentBuilder(item: TabBarItem, index: number) {
    if (index === 0) {
      HomePage();
    } else if (index === 1) {
      CreateShortView();
    } else if (index === 2) {
      ProfilePage();
    } else {
      // todo
    }
  }

  build() {
    Navigation(router.stack) {
      Column() {
        Tabs(
          {
            index: this.currentIndex,
            barPosition: BarPosition.End,
            controller: this.tabsController
          }
        ) {
          ForEach(defaultTabBarItems, (item: TabBarItem, index: number) => {
            TabContent() {
              this.tabContentBuilder(item, index)
            }
          })
        }
        .vertical(false)
        .scrollable(true)
        .layoutWeight(1)
        .backgroundColor('#ffdbd9d9')
        .barHeight(0) // 隐藏默认TabBar
        .onAnimationStart((index: number, targetIndex: number) => {
          this.currentIndex = targetIndex;
        })

        // 自定义TabBar
        TabBar({
          selectedIndex: this.currentIndex,
          tabBarItems: defaultTabBarItems,
        })
      }
      .width("100%")
      .height("100%")
    }
    .hideTitleBar(true)
    .hideToolBar(true)
    .width("100%")
    .height("100%")
  }
}