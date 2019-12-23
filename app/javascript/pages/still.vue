<template>
  <div>
    <h2>未完了のTodo</h2>
    <form @submit.prevent>
      <input type="text" v-model="body">
      <input type="date" v-model="valid_date">
      <input type="time" v-model="deadline">
      <button @click.prevent="createTodo">保存</button>
    </form>
    <ul>
      <li v-for="(todo, index) in todos" :key="todo.id" v-if="!todo.done">
        <input
          type="checkbox"
          @change="doneChange(index, todo.id, todo.done)"
          v-model="todo.done"
        />
        <span :class="{ done: todo.done }">{{ todo.body }}</span>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function() {
    return {
      //todoリスト
      todos: [],
      //テキストボックスの値
      body: "",
      valid_date: "",
      deadline: "",
      user_id: "",
    };
  },
  //一覧読み込み
  mounted() {
    axios
      .get("/api/stills")
      .then(response => {
        this.todos = response.data;
      })
      .catch(() => {
        alert("エラー");
      });
  },
  methods: {
    //Todo作成
    createTodo() {
      axios
        .post("/api/todos", { body: this.body, valid_date: this.valid_date, deadline: this.deadline })
        .then(response => {
          this.todos.unshift(response.data);
          this.body = "";
          this.valid_date = "";
          this.deadline = "";
        })
        .catch(() => {
          alert("エラー");
        });
    },
    //checkボックスで発火する済んだかどうかのやつ
    doneChange(index, donechange_id, done_flg) {
      axios
        .put(`/api/todos/${donechange_id}`, { done: done_flg })
        .then(response => {})
        .catch(() => {
          alert("エラー");
        });
    },
    //Todo削除（使っていない）
    deleteTodo(index, delete_id) {
      axios
        .delete(`/api/todos/${delete_id}`)
        .then(response => {
          this.todos.splice(index, 1);
        })
        .catch(() => {
          alert("エラー");
        });
    }
  }
};
</script>
