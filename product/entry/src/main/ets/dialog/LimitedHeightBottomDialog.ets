const ANIMATION_DURATION = 200           // 弹窗动画时长
const Y_TRANSLATE_DISTANCE = 100         // 弹窗动画y轴移动距离

@CustomDialog
export struct LimitedHeightBottomDialog{
  controller: CustomDialogController;
  title: string | Resource = '';       // 标题
  maxScrollHeight: Length = '90%';     // 最大可滚动区域高度
  wrapBuilder?: WrappedBuilder<[]>;    // 自定义视图创建方式
  @Link showFlag: Visibility;          // 视图是否显示，用于底部弹窗出现与消失时的动效处理
  @StorageLink('bottomHeight') bottomHeight: number = 20; // 底部导航栏高度

  build() {
    Column() {
      RelativeContainer() {
        Text(this.title)
          .fontSize(17)
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Bold)
          .alignRules({
            middle: { anchor: '__container__', align: HorizontalAlign.Center },
            center: { anchor: '__container__', align: VerticalAlign.Center }
          })

        SymbolGlyph($r("sys.symbol.xmark"))
          .width(36)
          .height(36)
          .padding(12)
          .alignRules({
            right: { anchor: '__container__', align: HorizontalAlign.End },
            center: { anchor: '__container__', align: VerticalAlign.Center }
          })
          .offset({
            x: -12
          })
          .onClick(() => {
            this.closeDialog();
          })
          .id('close_image')
      }.width("100%")
      .height(48)

      Scroll() {
        Column() {
          if (this.wrapBuilder) {
            // 创建自定义视图
            this.wrapBuilder.builder()
          }
        }.width("100%")
        .padding({ bottom: this.bottomHeight + 'px' })
      }.width("100%")
      // TODO：知识点：使用constraintSize方法可以设置约束尺寸，组件布局时，进行尺寸范围限制。这里设置Scroll组件的高度限制。
      .constraintSize({maxHeight: this.maxScrollHeight})
      .id('scroll')
    }.width("100%")
    .backgroundColor("#f5f5f5")
    .borderRadius({
      topLeft: 16,
      topRight: 16
    })
    .visibility(this.showFlag)
    .transition(TransitionEffect.OPACITY.animation({ duration: ANIMATION_DURATION })  // 弹窗出现与消失的动效
      .combine(TransitionEffect.translate({ y: Y_TRANSLATE_DISTANCE })),
      (transitionIn: boolean) => {
        if (!transitionIn) {
          this.controller.close();
        }
      }
    )
  }



  /**
   * 关闭弹窗
   */
  private closeDialog() {
    this.showFlag = Visibility.Hidden;
  }
}