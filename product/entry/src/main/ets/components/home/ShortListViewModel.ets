import { ShortItem } from "../../model/short";
import {WaterFlowDataSource} from "reusablepool"

@ObservedV2
export class ShortListViewModel {
    private pageSize: number = 20;

    constructor(category: string) {
    }

    @Trace shorts: WaterFlowDataSource = new WaterFlowDataSource();


    async load(page: number = 0) {

        this.shorts.addItems( [
            {
                id: "1",
                image: "https://plus.unsplash.com/premium_photo-1752434963682-0cc26bb2d4f7?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=735",
                type: 0,
                name: "Beautiful Landscape",
                des: "A stunning view of the mountains during sunrise.",
            },
            {
                id: "2",
                image: "https://images.unsplash.com/photo-1760835249990-ff68773c7c4c?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=715",
                type: 0,
                name: "City Timelapse",
                des: "A fast-paced view of city life.",
            },
            {
                id: "3",
                image: "https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=735",
                type: 0,
                name: "Ocean Waves",
                des: "Relaxing waves hitting the shore.",
            },
            {
                id: "4",
                image: "https://images.unsplash.com/photo-1494526585095-c41746248156?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=735",
                type: 0,
                name: "Forest Walk",
                des: "A peaceful walk through the forest.",
            },
            {
                id: "5",
                image: "https://images.unsplash.com/photo-1500534623283-312aade485b7?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=735",
                type: 0,
                name: "Desert Dunes",
                des: "Golden sand dunes under the clear sky.",
            }
        ])

    }



}