<template>
    <div id="title">
        <h1>Image Uploader System</h1>
        <h4>by I.E.U. Juboraj Naofel</h4>
    </div>
    <br>
    <br>
    <div class="form_div">
        <h4>Login</h4>
        <input v-model="lemail" type="text" placeholder="Enter Email" /><br>
        <input v-model="lpassword" type="password" placeholder="Enter Password" /><br>
        <a v-on:click="logFun" href="#">Login</a>
    </div>
    <br>
    <div id="nav">
        <router-link class="link" to="/register">Don't have an account? create here!</router-link> 
    </div>
</template>
<script>
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
                var string1 = "";
                if(this.lemail ==''){
                    string1 = string1+"Email required. ";
                }
                if(this.lpassword ==''){
                    string1 = string1+"Password required. ";
                }
                if(string1!=""){
                    alert(string1);
                    return
                }


                const data = {
                    email: this.lemail,
                    password: this.lpassword,
                };
                console.log("Request data . . . .", data);

                const requestOptions = {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(data)
                };

                var response = await fetch("http://127.0.0.1:8000/api/login", requestOptions);

                
                if(response.status == 200){
                    var data2 = await response.json();
                    console.log(data2.user_info)
                    localStorage.setItem('userInfo', JSON.stringify({ 'token': data2.token, 'user': data2.user_info}));
                    this.$router.push({ name: 'ProfilePage' })
                }else{
                    alert('Wrong Input!');
                }
                
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
    width: 300px;
    margin-left: auto;
    margin-right: auto;
    border-radius: 5px;
    border: 1px solid seagreen;
    padding: 10px;
}
.form_div a{
    border-radius: 5px;
    margin-left: auto;
    margin-right: auto;
    display: block;
    margin-bottom: 2px;
    height: 20px;
    width: 300px;
    text-decoration: none;
    padding: 10px;
    background-color: seagreen;
    color: white;
    border: 1px solid seagreen;
}
.form_div a:hover{
    background-color: rgb(62, 161, 105);
}
#title{
    width: 30%;
    min-width:200px;
    border-bottom: 2px rgb(193, 199, 195) solid;
    padding-top: 20px;
    margin-bottom: 10px;
    margin-left: auto;
    margin-right: auto;
    padding-bottom: 40px;
}
</style>