<template>
  <div>
    <van-radio-group v-model="provinceMediator.radio">
      <van-cell-group>
        <van-cell :title="item.province" v-for="(item, index) in list" :key="index" @click="selectProvince(item, index)">
          <template #right-icon>
            <van-radio :name="item.code" />
          </template>
        </van-cell>
      </van-cell-group>
    </van-radio-group>
  </div>
</template>
<script>
import { ProvinceMediator } from "@/mediator/province"
import { mapState } from "vuex"

export default {
  name: "ProvinceView",
  methods: {
    selectProvince(item) {
      item.click()
    },
  },
  created() {
    if (!this.provinceMediator) {
      const mediator = new ProvinceMediator()
      this.$store.commit("provinceMediator", mediator)
    }
  },
  computed: {
    ...mapState({
      provinceMediator: (state) => state.provinceMediator,
      advancedMediator: (state) => state.advancedMediator,
    }),
    list() {
      return this.provinceMediator.list
    },
  },
}
</script>
