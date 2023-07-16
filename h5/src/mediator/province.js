import { provinceList } from "@/assets/province"
import store from "@/store/index"
import { routerSubject } from "@/constant"

export class ProvinceMediator {
  radio = 0

  constructor() {
    this.radio = store.state.advancedMediator.provinceModel.data.code
  }

  get list() {
    let list = provinceList.map((item) => {
      item.click = () => {
        const provinceModel = store.state.advancedMediator.provinceModel
        provinceModel.data = item
        routerSubject.next({ type: "back" })
      }
      return item
    })
    return list
  }
}
