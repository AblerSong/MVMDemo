import router from "@/router"
import { messageSubject } from "@/constant.js"
import { BehaviorSubject, combineLatest } from "rxjs"
export class UpgradeMediator {
  username_text = "username"

  password_text = "password"

  login_btn_disabled = true

  set username_str(value) {
    this._username_str.next(value)
  }
  get username_str() {
    return this._username_str.value
  }

  set password_str(value) {
    this._password_str.next(value)
  }
  get password_str() {
    return this._password_str.value
  }

  onSubmit() {
    if (this.username_str == "admin" && this.password_str == "123456") {
      router.back()
    } else {
      messageSubject.next("input error")
    }
  }

  constructor() {
    this._init()
  }

  _init() {
    combineLatest([this._username_str, this._password_str]).subscribe(([value1, value2]) => {
      this.login_btn_disabled = !(value1?.length && value2?.length)
    })
  }

  // private

  _username_str = new BehaviorSubject("")
  _password_str = new BehaviorSubject("")
}
