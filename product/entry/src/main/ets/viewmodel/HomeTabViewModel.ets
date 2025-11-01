import { ShortItem } from "../model/model"


/**
 *  首页瀑布流列表信息
 */
export class ProductInfo {
  // id号
  id: number;
  // 图片地址
  imageSrc: ResourceStr;
  // 商品类型
  type: string;
  // 标题
  name?: string;
  // 描述信息
  description?: string;

  constructor(id: number, imageSrc: ResourceStr, type: string, name?: string, description?: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.type = type;
    this.name = name;
    this.description = description;
  }
}
// 瀑布流mock数据
export const waterFlowData: ProductInfo[] = [
  new ProductInfo(1, $r("app.media.product_image_top"), 'onlyImage'),
  new ProductInfo(2, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(3, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(4, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(5, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(6, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(7, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(8, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(9, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(10, $r("app.media.product_image_top"), 'onlyImage'),
  new ProductInfo(11, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(12, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(13, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(14, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(15, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(16, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(17, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(18, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(19, $r("app.media.product_image_top"), 'onlyImage'),
  new ProductInfo(20, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(21, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(22, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(23, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(24, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(25, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(26, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(27, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(28, $r("app.media.product_image_top"), 'onlyImage'),
  new ProductInfo(29, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(30, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(31, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(32, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(33, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(34, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(35, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(36, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(37, $r("app.media.product_image_top"), 'onlyImage'),
  new ProductInfo(38, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(39, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(40, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(41, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(42, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(43, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(44, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(45, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(46, $r("app.media.product_image_top"), 'onlyImage'),
  new ProductInfo(47, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(48, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(49, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(50, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(51, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(52, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(53, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(54, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(55, $r("app.media.product_image_top"), 'onlyImage'),
  new ProductInfo(56, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(57, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(58, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(59, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(60, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(61, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(62, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(63, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(64, $r("app.media.product_image_top"), 'onlyImage'),
  new ProductInfo(65, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(66, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(67, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(68, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(69, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(70, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(71, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(72, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(73, $r("app.media.product_image_top"), 'onlyImage'),
  new ProductInfo(74, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(75, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(76, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(77, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(78, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(79, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(80, $r("app.media.product_image_one"), 'imageMixText', 'HUAWEI Mate 70 Pro+16GB',
    '鸿蒙AI，高亮钛玄武架构，红枫原色'),
  new ProductInfo(81, $r("app.media.product_image_two"), 'imageMixText', '鸿蒙AI - 高亮钛玄武架构',
    '构建万物互联的智能世界'),
  new ProductInfo(82, $r("app.media.product_image_bottom"), 'bottomImageMixText'),
]


/**
 * 实现IDataSource接口的对象，用于瀑布流组件加载数据
 */
export class WaterFlowDataSource implements IDataSource {
  private dataArray: ProductInfo[] = [];
  private listeners: DataChangeListener[] = [];

  constructor(dataArray: ProductInfo[]) {
    for (let i = 0; i < dataArray.length; i++) {
      this.dataArray.push(dataArray[i]);
    }
  }

  /**
   * 获取索引对应的数据
   * @param index 数组索引
   * @returns
   */
  public getData(index: number): ProductInfo {
    return this.dataArray[index];
  }

  /**
   * 通知控制器数据重新加载
   */
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  /**
   * 通知控制器数据增加
   * @param index 数组索引
   */
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  /**
   * 通知控制器数据变化
   * @param index 数组索引
   */
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  /**
   * 通知控制器数据删除
   * @param index 数组索引
   */
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  /**
   * 通知控制器数据位置变化
   * @param from 起始位置
   * @param to 最终位置
   */
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }

  /**
   * 获取数据总数
   * @returns
   */
  public totalCount(): number {
    return this.dataArray.length;
  }

  /**
   * 注册改变数据的控制器
   * @param listener 数据控制器
   */
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  /**
   * 注销改变数据的控制器
   * @param listener 数据控制器
   */
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  /**
   * 增加数据
   */
  public add1stItem(): void {
    this.dataArray.splice(0, 0, this.dataArray[this.dataArray.length]);
    this.notifyDataAdd(0);
  }

  /**
   * 在数据尾部增加一个元素
   */
  public addLastItem(): void {
    this.dataArray.splice(this.dataArray.length, 0, this.dataArray[this.dataArray.length]);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  /**
   * 在指定索引位置增加一个元素
   * @param index
   */
  public addItem(index: number): void {
    this.dataArray.splice(index, 0, this.dataArray[this.dataArray.length]);
    this.notifyDataAdd(index);
  }

  /**
   * 删除第一个元素
   */
  public delete1stItem(): void {
    this.dataArray.splice(0, 1);
    this.notifyDataDelete(0);
  }

  /**
   * 删除第二个元素
   */
  public delete2ndItem(): void {
    this.dataArray.splice(1, 1);
    this.notifyDataDelete(1);
  }

  /**
   * 删除最后一个元素
   */
  public deleteLastItem(): void {
    this.dataArray.splice(-1, 1);
    this.notifyDataDelete(this.dataArray.length);
  }

  /**
   * 重新加载数据
   */
  public reload(): void {
    this.notifyDataReload();
  }

  /**
   * 改变数组数据
   * @param data：新数组
   */
  public modifyAllData(data: ProductInfo[]): void {
    this.dataArray = data;
    this.notifyDataReload();
  }
}
// @ObservedV2
// export class HomeTabViewModel {
//   waterFlowData = new WaterFlowDataSource([
//     {
//       id: 1,
//       cover: "https://www.liblib.art/imageinfo/7a571588c5fa43aea30fa2ae1fa4ed49",
//       type: "image",
//       title: "示例视频1",
//       description: "这是一个示例视频的描述",
//     },
//     {
//       id: 2,
//       cover: "https://www.liblib.art/imageinfo/d0ab8290613244fc891d37356192bb0f",
//       type: "video",
//       title: "示例视频2",
//       description: "这是另一个示例视频的描述",
//     },
//     {
//       id: 3,
//       cover: "https://www.liblib.art/imageinfo/814497d8cfd047fbb8ae5a550284e79c",
//       type: "image",
//       title: "示例视频3",
//       description: "这是第三个示例视频的描述",
//     },
//     {
//       id: 4,
//       cover: "https://www.liblib.art/imageinfo/39d68588a8684fa89035d980bd9a46c5",
//       type: "image",
//       title: "示例视频4",
//       description: "这是一个示例视频的描述",
//     },
//     {
//       id: 5,
//       cover: "https://www.liblib.art/imageinfo/8862d4b803e84108aa4585b8a90da52f",
//       type: "video",
//       title: "示例视频5",
//       description: "这是另一个示例视频的描述",
//     },
//     {
//       id: 6,
//       cover: "https://www.liblib.art/imageinfo/8a444ed2bf9f4287aa4a41a564f01a2f",
//       type: "image",
//       title: "示例视频6",
//       description: "这是第三个示例视频的描述",
//     },
//     {
//       id: 7,
//       cover: "https://www.liblib.art/imageinfo/6c3dcc39d35c4325a46eb18e4af78780",
//       type: "image",
//       title: "示例视频7",
//       description: "这是一个示例视频的描述",
//     },
//     {
//       id: 8,
//       cover: "https://www.liblib.art/imageinfo/bc6a6f3da9844fb5a18b73641c500683",
//       type: "video",
//       title: "示例视频8",
//       description: "这是另一个示例视频的描述",
//     },
//     {
//       id: 9,
//       cover: "https://www.liblib.art/imageinfo/c319174b82de497ca23aa0d330053dad",
//       type: "image",
//       title: "示例视频9",
//       description: "这是第三个示例视频的描述",
//     }
//   ])
//
//
// }
//
// export class WaterFlowDataSource implements IDataSource {
//   private listeners: DataChangeListener[] = []
//   private data: ShortItem[];
//
//   constructor(data: ShortItem[]) {
//   this.data = data;
// }
//
//   totalCount(): number {
//     return this.data.length
//   }
//
//   // 获取指定索引的数据
//   getData(index: number) {
//     return this.data[index]
//   }
//   registerDataChangeListener(listener: DataChangeListener): void {
//     if (!this.listeners.includes(listener)) {
//       this.listeners.push(listener)
//     }
//   }
//   unregisterDataChangeListener(listener: DataChangeListener): void {
//     const index = this.listeners.indexOf(listener)
//     if (index !== -1) {
//       this.listeners.splice(index, 1)
//     }
//   }
//
// }