import { routerSubject } from "@/constant.js"
import { BehaviorSubject, combineLatest } from "rxjs"
import store from "@/store"

export class AdvancedMediator {
  radioModel = null
  checkboxModel = null
  provinceModel = null
  calculatorModel = null
  submitModel = null

  constructor() {
    this.initModel()
  }
  initModel() {
    this.initRadioModel()
    this.initCheckboxModel()
    this.initProvinceModel()
    this.initCalculatorModel()
    this.initSubmitModel()
    this.initExpandModel()
    this.initStretchModel()
  }
  initStretchModel() {
    this.stretchModel = new StretchModel()
  }
  initExpandModel() {
    this.expandModel = new ExpandModel()
  }
  initRadioModel() {
    this.radioModel = new RadioModel()
  }
  initCheckboxModel() {
    this.checkboxModel = new CheckboxModel()
  }
  initProvinceModel() {
    this.provinceModel = new ProvinceModel()
  }
  initCalculatorModel() {
    this.calculatorModel = new CalculatorModel()
  }
  initSubmitModel() {
    this.submitModel = new SubmitModel()
    this.calculatorModel.totalCombineLatest.subscribe(([val1, val2]) => {
      this.submitModel.total = Number(val1) + Number(val2)
    })
  }

  get list() {
    let list = [
      { name: "Radio", model: this.radioModel, cls: "Radio" },
      { name: "Checkbox", model: this.checkboxModel, cls: "Checkbox" },
      { name: "Province", model: this.provinceModel, cls: "Province" },
      { name: "Calculator", model: this.calculatorModel, cls: "Calculator" },
      { name: "Submit", model: this.submitModel, cls: "Submit" },
      { name: "Expand", model: this.expandModel, cls: "Expand" },
      { name: "Stretch", model: this.stretchModel, cls: "Stretch" },
    ]
    return list
  }
}

class RadioModel {
  _radio = 1
  set radio(value) {
    this._radio = value
  }
  get radio() {
    return this._radio
  }

  list = [
    { label: 1, title: "radio1" },
    { label: 2, title: "radio2" },
    { label: 3, title: "radio3" },
  ]
}
class CheckboxModel {
  _checkList = []
  set checkList(value) {
    this._checkList = value
  }
  get checkList() {
    return this._checkList
  }
  list = [{ label: "checkbox1" }, { label: "checkbox2" }, { label: "checkbox3" }]
}
class ProvinceModel {
  selectProvince() {
    routerSubject.next({ name: "province" })
  }
  data = {
    province: "天津市",
    abbreviate: "津",
    code: "120000",
  }
}
class CalculatorModel {
  _value1 = new BehaviorSubject(0)
  _value2 = new BehaviorSubject(0)

  set value1(value) {
    this._value1.next(value)
  }
  get value1() {
    return this._value1.value
  }
  set value2(value) {
    this._value2.next(value)
  }
  get value2() {
    return this._value2.value
  }

  constructor() {
    this.totalCombineLatest = combineLatest([this._value1, this._value2])
  }
}
class SubmitModel {
  total = 0
  onSubmit() {
    let advancedMediator = store.state.advancedMediator
    // get all data
    console.log("get all data:", advancedMediator)
  }
}
class ExpandModel {
  expand = false
  direction = ""
  click() {
    this.expand = !this.expand
    this.direction = this.expand ? "down" : ""
  }
  get list() {
    if (this.expand) {
      return [{ title: "00000" }]
    }
    return []
  }
}
class StretchModel {
  className = ""
  stretch = false
  clickStretch() {
    this.stretch = !this.stretch
    this.className = this.stretch ? "className" : ""
  }
}
