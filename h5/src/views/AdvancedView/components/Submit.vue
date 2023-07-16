<template>
  <div class="wrap1">
    <div class="price">total price:{{ model.total }}</div>
    <van-button type="info" @click="model.onSubmit()">submit</van-button>
  </div>
</template>
<script>
export default {
  props: ["model"],
  methods: {
    onSubmit() {},
  },
}
</script>
