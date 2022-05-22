import { createRouter, createWebHistory } from 'vue-router';
import RegisterForm from './components/RegisterForm.vue';
import ProfilePage from './components/ProfilePage';

const routes = [
  {
    path: '/',
    name: 'RegisterForm',
    component: RegisterForm
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