import { ActionItem } from "../model/model"
import { promptAction } from "@kit.ArkUI"

@ObservedV2
export class MyProfileViewModel {
  firstSectionItems: ActionItem[] = [
    {
      title: $r('app.string.my_favorites'),
      subTitle: $r('app.string.my_favorites_subtitle'),
      onClick: () => {


      }
    },
    {
      title: $r('app.string.my_downloads'),
      subTitle: $r('app.string.my_downloads_subtitle'),
    }
  ];
  secondSectionItems: ActionItem[] = [
    {
      title: $r('app.string.settings'),
      subTitle: $r('app.string.settings_subtitle'),
      onClick: () => {
        promptAction.openToast({
          message: "hello settings"
        })
      }
    },
    {
      title: $r('app.string.about_us'),
      subTitle: $r('app.string.about_us_subtitle'),
      onClick: () => {
        promptAction.openToast({
          message: "hello about us "
        })
      }
    }
  ];



}