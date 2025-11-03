import { ShortItem, ShortItemType } from "../../model/short";
import faker from "faker"

export class ShortDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private items: ShortItem[] = [];

  // 获取索引对应的数据
  public getData(index: number): ShortItem {
    return this.items[index];
  }

  // 通知控制器数据重新加载
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知控制器数据增加
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知控制器数据变化
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知控制器数据删除
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  // 通知控制器数据位置变化
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }

  //通知控制器数据批量修改
  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }

  // 获取数据总数
  public totalCount(): number {
    return this.items.length;
  }

  // 注册改变数据的控制器
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  // 注销改变数据的控制器
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  addItem(item: ShortItem) {
    this.items.push(item)
    this.notifyDataAdd(this.items.length - 1);
  }

  clear() {
    this.items = []
  }
}

export enum FooterState {
  Loading = 0,
  End = 1
}

@ObservedV2
export class HomePageViewModel {
  @Trace shorts: ShortDataSource = new ShortDataSource();
  @Trace shortCategories: string[] = [
    "All",
    "Music",
    "Sports",
    "News",
    "Entertainment",
    "Education",
    "Technology",
    "Lifestyle"
  ];
  @Trace minSize: number = 150;
  @Trace maxSize: number = 240;
  @Trace footerState: FooterState = FooterState.Loading;
  @Trace page: number = 0;
  itemWidthArray: number[] = [];
  itemHeightArray: number[] = [];

  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize());
      this.itemHeightArray.push(this.getSize());
    }
  }

  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize);
    return (ret > this.minSize ? ret : this.minSize);
  }

  load(page: number) {
    for (let i = 0; i < 100; i++) {
      this.shorts.addItem({
        id: faker.string.uuid(),
        cover: faker.image.url(640, 480),
        type: "image",
        title: faker.lorem.sentence(),
        description: faker.lorem.paragraph(),
        author: faker.names.chineseName(),
        duration: faker.string.alpha(),
        createTime: faker.dateTime.past(1).toLocaleString(),
      })
    }
  }

  refreshItems() {
    this.shorts.clear();
    this.load(0);
    this.shorts.notifyDataReload();
  }
}