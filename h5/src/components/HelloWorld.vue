<template>
  <div class="hello">
    <van-cell-group>
      <van-cell @click="onSubmit">
        <template #title>
          <van-button type="primary">{{ model.title }}</van-button>
        </template>
      </van-cell>
    </van-cell-group>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  props: {
    model: Object,
  },
  methods: {
    onSubmit() {
      this.model.click()
    },
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
