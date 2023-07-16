<template>
  <div>
    <van-cell>
      <van-checkbox-group v-model="model.checkList" direction="horizontal">
        <van-checkbox :name="item.label" v-for="(item, index) in model.list" :key="index">{{ item.label }}</van-checkbox>
      </van-checkbox-group>
    </van-cell>
  </div>
</template>
<script>
export default {
  props: ["model"],
}
</script>
