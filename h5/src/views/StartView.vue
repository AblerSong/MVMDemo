<template>
  <div>
    <van-cell-group>
      <van-field v-model="startMediator.username_str" :label="username_text" placeholder="input admin" />
      <van-field v-model="startMediator.password_str" :label="password_text" placeholder="input 123456" />
      <van-button :type="login_btn_type" @click="onSubmit" :disabled="login_btn_disabled">login</van-button>
    </van-cell-group>
  </div>
</template>

<script>
import { StartMediator } from "@/mediator/start"
import { mapState } from "vuex"
export default {
  name: "StartView",
  created() {
    if (!this.startMediator) {
      const mediator = new StartMediator()
      this.$store.commit("startMediator", mediator)
    }
  },
  methods: {
    onSubmit() {
      this.startMediator.onSubmit()
    },
  },
  computed: {
    ...mapState({
      startMediator: (state) => state.startMediator,
    }),
    username_text() {
      return this.startMediator?.username_text ?? ""
    },
    password_text() {
      return this.startMediator?.password_text ?? ""
    },
    login_btn_disabled() {
      return this.startMediator?.login_btn_disabled
    },
    login_btn_type() {
      return "primary"
    },
  },
}
</script>

<style lang="scss">
.login {
  display: flex;
  flex-direction: column;
  .username {
    display: flex;
  }
  .password {
    display: flex;
  }
}
</style>
