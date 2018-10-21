const Login = () => import('../pages/login').then(m => m.default)
const Register = () => import('../pages/register').then(m => m.default)
const Main = () => import('../pages/main').then(m => m.default)

export default [
  {
    path: '*',
    redirect: '/'
  },
  {
    path: '/',
    name: 'login',
    meta: {
      keepAlive: false
    },
    component: Login
  },
  {
    path: '/register',
    name: 'register',
    meta: {
      keepAlive: false
    },
    component: Register
  },
  {
    path: '/main',
    name: 'main',
    meta: {
      keepAlive: false
    },
    component: Main
  }
]
