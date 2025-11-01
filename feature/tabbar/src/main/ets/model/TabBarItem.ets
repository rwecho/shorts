export interface TabBarItem {
    icon: string
    title: string
}

export const defaultTabBarItems: TabBarItem[] = [
    {
        icon: "app.media.tab_icon_home",
        title: 'app.string.tab_title_home'
    },
    {
        icon: 'app.media.tab_icon_plus',
        title: 'app.string.tab_title_plus'
    },
    {
        icon: 'app.media.tab_icon_profile',
        title: 'app.string.tab_title_profile'
    }
]