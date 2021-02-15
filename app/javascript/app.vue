<template>
  <div id="app">
    <router-link to="/">Home</router-link> |
    <router-link to="/user/:id">User</router-link> |
    <router-view></router-view>
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
