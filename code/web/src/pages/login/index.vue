<template>
  <div id="login">
    <h1>Login</h1>

    <h4>Username</h4>
    <cube-input v-model="username" placeholder="please enter username"></cube-input>
    <h4>Password</h4>
    <cube-input type="password" v-model="password" placeholder="please enter password"></cube-input>
    <cube-button @click="submit">Login</cube-button>

    <p>No account? <span @click="toRegister">Click here to register</span></p>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data() {
    return {
      username: 'admin',
      password: '123456'
    }
  },
  methods: {
    toRegister() {
      this.$router.push('/register')
    },
    async submit() {
      if (!this.username || !this.password) {
        this.toast('Please check the input')
      }

      try {
        let rep = (await axios.post('/user/login', {
          username: this.username,
          password: this.password
        })).data
        console.log(rep)
        if (rep.code != 0) throw Error(rep.msg)
        window.user = rep.data
        window.token = rep.data.token
        axios.defaults.headers.common['Authorization'] = `token  ${
          rep.data.token
        }`
        this.$router.push('/main')
      } catch (err) {
        this.toast(err.message || 'error')
      }
    }
  }
}
</script>

<style lang="scss" scoped>
#login {
  font-size: 16px;
  width: 100%;
  height: 100%;
  padding: 16px;
  h1 {
    font-size: 50px;
    margin-top: 60px;
  }
  h4 {
    font-size: 18px;
    margin-top: 16px;
    margin-bottom: 8px;
    color: #565656;
    margin-left: 8px;
  }
  .cube-btn {
    margin-top: 16px;
  }
  p {
    font-size: 16px;
    margin-top: 16px;
    text-align: right;
    color: #969696;
  }
  span {
    color: #3bafda;
  }
}
</style>