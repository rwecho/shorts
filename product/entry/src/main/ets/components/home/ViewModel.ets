import { ShortItem } from "../../model/short";

@ObservedV2
export class HomeViewModel {
    @Trace count: number = 0;
    @Trace shorts: ShortItem[] = [];
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

    load() {

    }

    loadMore() {

    }

    incrementCount() {
        this.count += 1;
    }

    decrementCount() {
        if (this.count > 0) {
            this.count -= 1;
        }
    }
}