<template>
  <div class="wrap2">
    <button class="button" @click="model.clickStretch()">click me</button>
    <button :class="['content', model.className]"></button>
  </div>
</template>
<script>
export default {
  props: ["model"],
}
</script>
