import Vue from "vue";
import Router from "vue-router";

const Home =() => import("./views/Home.vue");
const User =() => import("./views/User.vue");
const UserPosts =() => import("./views/posts/UserPosts.vue");

Vue.use(Router);

export default new Router({
  mode: 'history',
  routes: [
    {path: '/', component: Home},
    {path: '/user/:id', 
    components: {
      default: User,
    },
    props: {
      default: true
    },
    children: [
      { path: "posts", component: UserPosts},
      // { path: "profile", component: UserProfile, name: "users-id-profile"},
    ]
  },
  ]
});