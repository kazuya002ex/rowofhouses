<template>
  <div>
    <h1>Sign Up!</h1>
      <form @submit.prevent='signup'>
        <li>名前</li>
        <input type="text" v-model="name" required="required">

        <li>パスワード</li>
        <input type="password" v-model="password" required="required">

        <li>パスワード（確認）</li>
        <input type="password" v-model="password_confirmation" required="required">

        <button type="submit">サインアップ</button>
      </form>
  </div>
</template>


<script>
import axios from "axios"

export default {
  name: 'Signup',
  data() {
    return {
      name: "",
      password: "",
      password_confirmation: "",
      error: "",
    }
  },
  created() {
    this.checkSignedIn()
  },
  updated() {
    this.checkSignedIn()
  },
  methods: {
    // サインアップ
    signup() {
      this.$http.plain.post('/api/signup', { name: this.name, password: this.password, password_confirmation: this.password_confirmation })
        .then(response => this.signupSuccessful(response))
        .catch(error => this.signupFailed(error))
    },
    signupSuccessful(response) {
      if (!response.data.csrf) {
        this.signupFailed(response)
        return
      }
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.$store.dispatch('doFetchSignedIn')
      this.error = ''
      this.$router.replace('/')
    },
    signupFailed(error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkSignedIn() {
      if (localStorage.signedIn) {
        this.$router.replace('/')
      }
    }
  }
}
</script>