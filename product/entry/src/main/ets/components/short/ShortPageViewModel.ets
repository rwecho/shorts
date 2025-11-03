import { ShortItem } from "../../model/short";
import faker from "faker"

@ObservedV2
export class ShortPageViewModel {
  private readonly shortId: string;
  @Trace item?: ShortItem;

  constructor(shortId: string) {
    this.shortId = shortId;
  }

  load() {
    this.item = {
      id: faker.string.uuid(),
      cover: faker.image.url(640, 480),
      type: "image",
      title: faker.lorem.sentence(),
      description: faker.lorem.paragraph(),
      author: faker.names.chineseName(),
      duration: faker.string.alpha(),
      createTime: faker.dateTime.past(1).toLocaleString(),
    }
  }
}