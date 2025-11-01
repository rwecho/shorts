// 瀑布流子组件数据结构
@Observed
export class ViewItem {
  id: string = "";
  // 名字
  name: string = "";
  // 描述
  des: string = "";
  // 类型
  type: number = 0;
  // 封面图片
  image: string | Resource = "";
}