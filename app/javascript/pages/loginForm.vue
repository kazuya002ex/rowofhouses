<template>
  <div>
    <h1>Login!</h1>
      <li>名前</li>
      <input type="text">

      <li>パスワード</li>
      <input type="password">

      <button>ログイン</button>
  </div>
</template>


<script>
export default {
  data() {
    return {
      name: "",
      password: "",
    }
  },
  methods: {
    // ログイン処理
  }
}
</script>