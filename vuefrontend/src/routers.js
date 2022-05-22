import ProfilePage from './components/ProfilePage.vue';
import RegisterForm from './components/RegisterForm.vue';
import { createRouter, createWebHistory } from 'vue-router';

const routes = [
    {
        name: 'ProfilePage',
        component: ProfilePage,
        path: '/'
    },

    {
        name: 'RegisterForm',
        component: RegisterForm,
        path: 'login-or-register'
    },


]
const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router;