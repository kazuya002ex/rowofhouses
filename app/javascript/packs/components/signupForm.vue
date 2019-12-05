<template>
  <div>
    <h1>Sign Up!</h1>
      <li>名前</li>
      <input type="text">

      <li>パスワード</li>
      <input type="password">

      <li>パスワード（確認）</li>
      <input type="password">

      <button>サインアップ</button>
  </div>
</template>


<script>
export default {
  data() {
    return {
      name: "",
      password: "",
      // password_confirmation
    }
  },
  methods: {
    // サインアップ用の内容をaxiosを使ってRailsに送る
  }
}
</script>