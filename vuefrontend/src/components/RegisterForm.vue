<template>
    <h1>Image Uploader System by I.E.U. Juboraj Naofel</h1>
    <br>
    <br>

    <div class="form_div">
        <h4>Register</h4>
        <input v-model="name" type="text" placeholder="Enter Name" /><br>
        <input v-model="email" type="text" placeholder="Enter Email" /><br>
        <input v-model="password" type="password" placeholder="Enter Password" /><br>
        <button v-on:click="regFun"  >Register</button>
    </div>
    <br>
    <div id="nav">
        <router-link class="link" to="/">Already have an account? Login here!</router-link>
    </div>
</template>
<script>
    //import axios from 'axios';
    export default {
        name: 'RegisterForm',
        data() {
            return {
                name:'',
                email:'',
                password:'',
                lemail:'',
                lpassword:'',
                isHidden: false
            }
        },
        methods:{
            async regFun(){
                console.warn('Sign up', this.name,this.email,this.password);
                // let res = await axios.post('localhost:8000/api/register', {
                //     name: this.name,
                //     email: this.email,
                //     password:this.password
                // })
                // console.log(res);
                alert('Registration Successfull!');
                localStorage.setItem('userInfo', JSON.stringify({'name': "1234"}));
                this.$router.push({name: 'ProfilePage'})
                
            }
        },
        mounted(){
            let user = localStorage.getItem('userInfo')
            if(user){
                this.$router.push({name: 'ProfilePage'})
            }
        }
    };
</script>

<style>
.link{
    text-decoration: none;
    color: seagreen;
}
.form_div input{
    display: block;
    margin-bottom: 2px;
    height: 20px;
    width: 200px;
    margin-left: auto;
    margin-right: auto;
    border-radius: 5px;
    border: 1px solid seagreen;
    padding: 10px;
}
.form_div button{
    border-radius: 5px;
    margin-left: auto;
    margin-right: auto;
    display: block;
    margin-bottom: 2px;
    height: 40px;
    width: 220px;
    padding: 10px;
    background-color: seagreen;
    color: white;
    border: 1px solid seagreen;
}
</style>