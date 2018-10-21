<template>
  <div id="register">
    <h1>Register</h1>

    <h4>Enter username</h4>
    <cube-input v-model="username" placeholder="Enter your user name"></cube-input>
    <h4>Enter password</h4>
    <cube-input v-model="password" placeholder="Enter your password"></cube-input>
    <h4>Enter password again</h4>
    <cube-input v-model="apassword" placeholder="Please enter your password again"></cube-input>

    <cube-checkbox v-model="restaurant" position="right" shape="square" :hollow-style="true">
      I am the restaurant owner
    </cube-checkbox>

    <cube-button @click="submit">Register</cube-button>

    <div class="back">
        <i class="cubeic-back " @click="back">back</i>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data() {
    return {
      username: '',
      password: '',
      apassword: '',
      restaurant: false
    }
  },
  methods: {
    back() {
      this.$router.go(-1)
    },
    async submit() {
      if (!this.username || !this.password || !this.apassword) {
        this.toast('Please check the input')
      }

      if (this.password != this.apassword) {
        this.toast('The password entered again is inconsistent')
      }

      try {
        let rep = (await axios.post('/user/register', {
          username: this.username,
          password: this.password,
          identity: this.restaurant ? 2 : 1
        })).data
        console.log(rep)
        if (rep.code != 0) throw Error(rep.msg)

        this.back()
      } catch (err) {
        this.toast(err.message || 'error')
      }
    }
  }
}
</script>

<style lang="scss" scoped>
#register {
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
  .cube-radio-group {
    margin-top: 16px;
  }

  .cube-checkbox {
    margin-top: 16px;
  }

  .cube-btn {
    margin-top: 16px;
  }

  .back {
    margin-top: 24px;
    color: #565656;
    text-align: end;
  }
}
</style>