<template>
  <div>
    <van-cell-group>
      <van-field v-model="model.value1" label="price1" placeholder="input price" />
      <van-field v-model="model.value2" label="price2" placeholder="input price" />
    </van-cell-group>
  </div>
</template>
<script>
export default {
  props: ["model"],
}
</script>
