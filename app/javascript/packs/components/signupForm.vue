<template>
  <div>
    <h1>Sign Up!</h1>
      <form @submit.prevent>
        <li>名前</li>
        <input type="text" v-model="name">

        <li>パスワード</li>
        <input type="password" v-model="password">

        <li>パスワード（確認）</li>
        <input type="password" v-model="password_confirmation">

        <button @click.prevent="createUser">サインアップ</button>
      </form>
  </div>
</template>


<script>
import axios from "axios"

export default {
  data() {
    return {
      name: "",
      password: "",
      password_confirmation: "",
    }
  },
  methods: {
    // サインアップ
    createUser() {
      axios.post("api/v2/users", { name: this.name,
      password: this.password,
      password_confirmation: this.password_confirmation
      })
      .then((response) => {
        console.log(this.password)
        console.log(this.password_confirmation)
        this.name = "";
        this.password = "";
        this.password_confirmation = "";
        alert("サインアップ");
      }).catch(() => {
        alert("クライアントエラー");
      });
    },
  }
}
</script>