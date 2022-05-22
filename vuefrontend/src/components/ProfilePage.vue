<template>
    <a class="btn" v-on:click="logoutFun">Logout</a>
    <h1>Hello User, welcome to homepage!</h1>
    <router-link class="btn" to="/add-image">Add image</router-link>
</template>
<script>
export default {
    name: 'ProfilePage',
    methods: {
        logoutFun() {
            localStorage.removeItem('userInfo');
            this.$router.push({ name: 'RegisterForm' })
        },
    },
    mounted() {
        let user = localStorage.getItem('userInfo')
        if (!user) {
            this.$router.push({ name: 'RegisterForm' })
        }
    }
}
</script>
<style>
.btn{
    text-decoration: none;
    background-color: seagreen;
    color: aliceblue;
    padding: 5px;
    border-radius: 5px;
}
.btn:hover{
    text-decoration: none;
    background-color: rgb(25, 83, 50);
    color: aliceblue;
}
</style>