export type ShortItemType = "image" | "video"

// 这里我们将一些多媒体的内容统称为 short item
export interface ShortItem {
    id: string,
    cover: string,
    type: ShortItemType,
    title?: string,
    description?: string,
    author?: string,
    duration?: string
    createTime?: string
    tags?: string[]
}