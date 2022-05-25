<template>

    <div id="title">
        <h1>Welcome!</h1>
        <h4>user name</h4>
    </div>
    <br>
    <router-link class="btn" to="/add-image">Add image</router-link> &nbsp;
    <a class="btn" v-on:click="logoutFun">Logout</a>
    <br>
    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="user in users" :key="user.id">
                <td>{{ user.firstName }} {{ user.lastName }}</td>
                <td>{{ user.email }}</td>
                <td>{{ user.role }}</td>
            </tr>
        </tbody>
    </table>
</template>
<script>
import { ref } from 'vue';
export default {
    name: 'ProfilePage',
    setup() {
        // make users variable reactive with the ref() function
        const users = ref([
            { firstName: 'Frank', lastName: 'Murphy', email: 'frank.murphy@test.com', role: 'User' },
            { firstName: 'Vic', lastName: 'Reynolds', email: 'vic.reynolds@test.com', role: 'Admin' },
            { firstName: 'Gina', lastName: 'Jabowski', email: 'gina.jabowski@test.com', role: 'Admin' },
            { firstName: 'Jessi', lastName: 'Glaser', email: 'jessi.glaser@test.com', role: 'User' },
            { firstName: 'Jay', lastName: 'Bilzerian', email: 'jay.bilzerian@test.com', role: 'User' }
        ]);

        return {
            users
        };
    },
    data() {
        return {
            items: [{ message: 'Foo' }, { message: 'Bar' }]
        }
    },
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
.btn {
    text-decoration: none;
    background-color: seagreen;
    color: aliceblue;
    padding: 10px;
    border-radius: 5px;
}

.btn:hover {
    text-decoration: none;
    background-color: rgb(25, 83, 50);
    color: aliceblue;
}
</style>