<template>
<div>
  <h1>HomeVue!!</h1>
  <button>
    <router-link to="api/v1/posts">投稿一覧</router-link>
  </button>
</div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      users: []
    }
  },
  mounted() {
    axios
      //GETリクエストでRailsで作成したjsonを取得する
      .get('/api/v1/users.json')
      //response.data は RailsのUser.select(:id, :name, :email)
      //これをdata()で定義したusersに代入する
      .then(response => (this.users = response.data))
  }
}
</script>