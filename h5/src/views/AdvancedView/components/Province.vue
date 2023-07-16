<template>
  <van-cell title="city" is-link :value="data.province" @click="selectProvince" />

</template>
<script>
export default {
  props: ["model"],
  methods: {
    selectProvince() {
      this.model.selectProvince()
    },
  },
  computed: {
    data() {
      let data = this.model.data
      return data
    },
  },
}
</script>
