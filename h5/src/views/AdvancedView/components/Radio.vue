<template>
  <div>
    <van-cell>
      <van-radio-group v-model="model.radio" direction="horizontal">
        <van-radio :name="item.label" v-for="(item, index) in model.list" :key="index">{{ item.title }}</van-radio>
      </van-radio-group>
    </van-cell>
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
