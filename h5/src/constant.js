import { Subject } from "rxjs"
import router from "@/router"
import { Toast } from "vant"

export const messageSubject = new Subject("")
messageSubject.subscribe((value) => {
  Toast(value)
})

export const routerSubject = new Subject("")
routerSubject.subscribe((obj) => {
  if (obj.type == "back") {
    router.back()
    return
  }
  router.push(obj.name)
})
