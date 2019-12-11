import Vue from 'vue'
import Vuex from 'vuex'
import router from '../router/router.js'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        todos: [],
        signedIn: '',
    },
    mutations: {
        fetchSignedIn(state) {
            // ログイン時にBooleanがlocalStorageに保存される。
            state.signedIn = !!localStorage.signedIn
        },
        fetchTodos(state) {
            axios.get('/api/todos').then((res) => {
                for (var i = 0; i < res.data.todos.length; i++) {
                    state.todos.push(res.data.todos[i]);
                }
            }, (error) => {
                console.log(error);
            });
        }
    },
    actions: {
        // ログイン時などで[$store.dispatch('doFetchSignedIn')]で次のメソッドを呼び出し、[signedIn]を更新する。
        doFetchSignedIn({ commit }) {
            commit('fetchSignedIn')
        }
    }
})