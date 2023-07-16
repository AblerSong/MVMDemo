import Vue from "vue"
import VueRouter from "vue-router"
import HomeView from "../views/HomeView.vue"

Vue.use(VueRouter)

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/startView",
    name: "startView",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ "../views/StartView.vue"),
  },
  {
    path: "/upgradeView",
    name: "upgradeView",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ "../views/UpgradeView"),
  },
  {
    path: "/advancedView",
    name: "advancedView",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ "../views/AdvancedView"),
  },
  {
    path: "/province",
    name: "province",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ "../views/ProvinceView"),
  },
]

const router = new VueRouter({
  routes,
})

export default router
