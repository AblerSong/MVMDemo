import Vue from "vue"
import Vuex from "vuex"
import { AdvancedMediator } from "@/views/AdvancedView/js/mediator"

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    startMediator: null,
    advancedMediator: null,
    upgradeMediator: null,
    provinceMediator: null,
  },
  getters: {},
  mutations: {
    startMediator(state, obj) {
      state.startMediator = obj
    },
    advancedMediator(state, obj) {
      state.advancedMediator = obj
    },
    upgradeMediator(state, obj) {
      state.upgradeMediator = obj
    },
    provinceMediator(state, obj) {
      state.provinceMediator = obj
    },
  },
  actions: {
    initAdvancedMediator({ commit, state }) {
      if (!state.advancedMediator) {
        commit("advancedMediator", new AdvancedMediator())
      }
    },
  },
  modules: {},
})
