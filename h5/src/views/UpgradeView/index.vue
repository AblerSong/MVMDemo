<template>
  <div>
    <van-cell-group>
      <van-field v-model="mediator.username_str" :label="username_text" placeholder="input admin" />
      <van-field v-model="mediator.password_str" :label="password_text" placeholder="input 123456" />
      <van-button :type="login_btn_type" @click="onSubmit" :disabled="login_btn_disabled">login</van-button>
    </van-cell-group>
  </div>
</template>

<script>
import { mapState } from "vuex"
import { UpgradeMediator } from "./js/upgrade.js"
export default {
  name: "UpgradeView",
  created() {
    if (!this.mediator) {
      const mediator = new UpgradeMediator()
      this.$store.commit("upgradeMediator", mediator)
    }
  },
  methods: {
    onSubmit() {
      this.mediator.onSubmit()
    },
  },
  destroyed() {
    this.$store.commit("upgradeMediator", null)
  },
  computed: {
    ...mapState({
      mediator: (state) => state.upgradeMediator,
    }),
    username_text() {
      return this.mediator?.username_text ?? ""
    },
    password_text() {
      return this.mediator?.password_text ?? ""
    },
    login_btn_disabled() {
      return this.mediator?.login_btn_disabled
    },
    login_btn_type() {
      if (this.login_btn_disabled) {
        return "info"
      }
      return "primary"
    },
  },
}
</script>
