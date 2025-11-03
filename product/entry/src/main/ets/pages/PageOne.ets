@Builder
export function PageOneBuilder(name: string, param: object) {
  PageOne({
    name: name,
    objectString: JSON.stringify(param)
  });
}

@ComponentV2
export struct PageOne {
  @Require @Param name: string;
  @Require @Param objectString: string;
  private menuItems: NavigationMenuItem[] = [
    {
      value: "1",
      icon: $r("app.media.custom_tab_new"),
      action: () => {
      }
    },
    {
      value: "2",
      icon: $r("app.media.product_image_top"),
      action: () => {
      }
    }
  ];

  build() {
    NavDestination() {
      Column() {
        Text("hello world")
        Text(this.name)
        Text(this.objectString)
      }
      .width("100%")
      .height("100%")
    }
    .title("Page One")
    .menus(this.menuItems)
    // .onBackPressed(() => {
    //   return true;
    // })
    .onReady((context: NavDestinationContext) => {
      // 页面加载完成回调
      console.info("PageOne is ready");
    });
  }
}