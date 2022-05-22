import { createRouter, createWebHistory } from 'vue-router';
import RegisterForm from './components/RegisterForm.vue';
import LoginForm from './components/LoginForm.vue';
import ProfilePage from './components/ProfilePage';
import AddImagePage from './components/AddImagePage';

const routes = [
  {
    path: '/register',
    name: 'RegisterForm',
    component: RegisterForm
  },
  {
    path: '/',
    name: 'LoginForm',
    component: LoginForm
  },
  {
    path: '/add-image',
    name: 'AddImagePage',
    component: AddImagePage
  },
  {
    path: '/profile',
    name: 'ProfilePage',
    component: ProfilePage,
  },
]
const router = createRouter({
  history: createWebHistory(),
  routes
})
export default router