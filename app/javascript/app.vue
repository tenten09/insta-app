<template>
  <div id="app">
    <router-link to="/">Home</router-link> |
    <router-link to="/users">User</router-link> |
    <router-view></router-view>
    <p>{{ message }}</p>
    <ul>
      <li v-for="post in posts" :key="post.id">
        {{ post.title }}： {{ post.body }}
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      message: "Hello Vue!",
      posts: "posts"
    }
  },
  mounted () {
    this.setPost();
  },
  methods: {
    setPost: function () {
      axios.get('/api/v1/posts')
      .then(response => (
        this.posts = response.data
      ))
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
