<template>
  <div id="main">
    <div class="main" :style="{background:bgc}">
      <router-view></router-view>
    </div>
    <footer>
      <span class="tab" @click="changeColor('red')">restaurant</span>
      <span class="tab" @click="changeColor('yellow')" >Notice</span>
      <span class="tab" @click="changeColor('blue')">Me</span>
    </footer>
  </div>
</template>

<script>
export default {
  data() {
    return {
      bgc: 'red'
    }
  },
  methods: {
    changeColor(color) {
      this.bgc = color
    }
  }
}
</script>

<style  lang="scss" scoped>
#main {
  font-size: 16px;
  height: 100%;
  display: flex;
  flex-direction: column;
  background: red;
  .main {
    flex: 1;
  }
  footer {
    height: 50px;
    display: flex;
    background-color: #fff;
    border-top: 1px solid #dfdfdf;
    .tab {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
    }
  }
}
</style>