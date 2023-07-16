<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <HelloWorld :model="item" v-for="(item, index) in list" :key="index" />
  </div>
</template>

<script>
import HelloWorld from "@/components/HelloWorld.vue"
export default {
  name: "HomeView",
  data() {
    return {
      list: [
        {
          title: "start",
          click: () => {
            this.$router.push({ name: "startView" })
          },
        },
        {
          title: "upgrade",
          click: () => {
            this.$router.push({ name: "upgradeView" })
          },
        },
        {
          title: "advanced",
          click: () => {
            this.$router.push({ name: "advancedView" })
          },
        },
      ],
    }
  },
  components: {
    HelloWorld,
  },
}
</script>
