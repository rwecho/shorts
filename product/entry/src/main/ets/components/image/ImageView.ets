@ComponentV2
export struct ImageView {
  @Require @Param url: string;
  @Local loadingState: 'loading' | 'success' | 'error' = 'loading';

  build() {
    Stack() {
      // 实际图片
      Image(this.url)
        .objectFit(ImageFit.Cover)
        .width("100%")
        .height("100%")
        .borderRadius({
          topLeft: 8,
          topRight: 8
        })
        .onComplete(() => {
          this.loadingState = 'success';
        })
        .onError(() => {
          this.loadingState = 'error';
        })
        .visibility(this.loadingState === 'success' ? Visibility.Visible : Visibility.Hidden)

      // 加载中界面
      if (this.loadingState === 'loading') {
        Column() {
          LoadingProgress()
            .width(40)
            .height(40)
            .color('#c3c3c3')
        }
        .width("100%")
          .height("100%")
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#F5F5F5')
          .borderRadius({
            topLeft: 8,
            topRight: 8
          })
      }

      // 错误界面
      if (this.loadingState === 'error') {
        Column({ space: 8 }) {
          Text('图片加载失败')
            .fontSize(14)
            .fontColor('#999999')
          Text('点击重试')
            .fontSize(12)
            .fontColor('#666666')
        }
        .width("100%")
          .height("100%")
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#F5F5F5')
          .borderRadius({
            topLeft: 8,
            topRight: 8
          })
          .onClick(() => {
            this.loadingState = 'loading';
          })
      }
    }
    .width("100%")
      .layoutWeight(1)
  }
}