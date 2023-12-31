import store from "@/store"
import { StartMediator } from "@/mediator/start"
describe("vuex", () => {
  test("StartMediator", () => {
    const mediator = new StartMediator()
    store.commit("startMediator", mediator)
    expect(store.state.startMediator.username_text).toBe("username")
    expect(store.state.startMediator.password_text).toBe("password")
    expect(store.state.startMediator.login_btn_disabled).toBe(true)

    mediator.username_str = "admin"
    expect(store.state.startMediator.login_btn_disabled).toBe(true)
    mediator.password_str = "123456"
    expect(store.state.startMediator.login_btn_disabled).toBe(false)
  })
})
