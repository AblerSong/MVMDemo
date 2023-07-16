import router from "@/router"
export class StartMediator {
  username_text = "username"
  password_text = "password"
  _username_str = ""
  _password_str = ""
  login_btn_disabled = true

  constructor() {
    this.init()
  }
  init() {}

  set username_str(value) {
    this._username_str = value
    this.update_login_btn_disabled()
  }
  get username_str() {
    return this._username_str
  }

  set password_str(value) {
    this._password_str = value
    this.update_login_btn_disabled()
  }
  get password_str() {
    return this._password_str
  }

  update_login_btn_disabled() {
    this.login_btn_disabled = !(this.username_str?.length && this.password_str?.length)
  }

  onSubmit() {
    if (this.username_str == "admin" && this.password_str == "123456") {
      router.back()
    } else {
    }
  }
}
