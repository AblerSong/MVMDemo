<template>
  <div class="advanced">
    <van-cell-group>
      <component :is="item.name" :model="item.model" v-for="(item, index) in list" :key="index" :class="item.cls" />
    </van-cell-group>
  </div>
</template>
<script>
import { mapState } from "vuex"
import Checkbox from "./components/Checkbox"
import Radio from "./components/Radio"
import Province from "./components/Province"
import Calculator from "./components/Calculator"
import Submit from "./components/Submit"
import Expand from "./components/Expand"
import Stretch from "./components/Stretch"

export default {
  created() {
    this.$store.dispatch("initAdvancedMediator")
  },
  components: {
    Radio,
    Checkbox,
    Province,
    Calculator,
    Submit,
    Expand,
    Stretch,
  },
  computed: {
    ...mapState({
      advancedMediator: (state) => state.advancedMediator,
    }),
    list() {
      let list = this.advancedMediator.list
      return list
    },
  },
}
</script>
<style lang="scss">
// write css only in page
@import "./css/style.scss";
</style>
