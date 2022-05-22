<template>
    <h1>Image Uploader System by I.E.U. Juboraj Naofel</h1>
    <br>
    <br>
    <div class="form_div">
        <h4>Login</h4>
        <input v-model="lemail" type="text" placeholder="Enter Email" /><br>
        <input v-model="lpassword" type="password" placeholder="Enter Password" /><br>
        <button v-on:click="logFun" >Login</button>
    </div>
    <br>
    <div id="nav">
        <router-link class="link" to="/register">Don't have an account? create here!</router-link> 
    </div>
</template>
<script>
    import axios from 'axios';
    export default {
        name: 'LoginForm',
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
            async logFun(){
                console.warn('Log',this.lemail,this.lpassword);
                let res = await axios.post('localhost:8000/login', {
                    email: this.lemail,
                    password:this.lpassword
                })
                console.log(res);
            },
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