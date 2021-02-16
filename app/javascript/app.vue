<template>
  <div id="app">
    <router-link to="/">Home</router-link> |
    <router-link to="/users">User</router-link> |
    <router-view></router-view>
    <p>{{ message }}</p>
    <ul>
      <li v-for="post in posts" :key="post.id">
        {{post.id}} {{ post.title }}
        <br>
         {{ post.body }}
      </li>
    </ul>
    <div>
      <input v-model="title" placeholder="title">
      <input v-model="body" placeholder="body">
      <button @click="addPost">新規投稿</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      message: "Hello Vue!",
      posts: "posts",
      title: '',
      body: '',
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
    },
    addPost: function() {
      axios.post('/api/v1/posts', {
        title: this.title,
        body: this.body
      })
      .then(response => (
        this.setPost()
      ));
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
