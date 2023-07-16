<template>
  <div>
    <van-cell title="click me" is-link :arrow-direction="model.direction" value="" @click="model.click()"/>
    <van-cell title="单元格" value="内容" v-for="(item, index) in list" :key="index" />
  </div>
</template>

<script>
export default {
  props: ["model"],
  computed: {
    list() {
      let list = this.model.list
      return list
    },
  },
}
</script>
