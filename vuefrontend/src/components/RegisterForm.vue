<template>
    <div id="title">
        <h1>Image Uploader System</h1>
        <h4>by I.E.U. Juboraj Naofel</h4>
    </div>
    <br>
    <br>

    <div class="form_div">
        <h4>Register</h4>
        <input v-model="name" type="text" placeholder="Enter Name" /><br>
        <input v-model="email" type="text" placeholder="Enter Email" /><br>
        <input v-model="password" type="password" placeholder="Enter Password" /><br>
        <input v-model="password_confirmation" type="password" placeholder="Enter Password Again" /><br>
        <a href="#" v-on:click="regFun">Register</a>
    </div>
    <br>
    <div id="nav">
        <router-link class="link" to="/">Already have an account? Login here!</router-link>
    </div>
</template>
<script>

export default {
    name: 'RegisterForm',
    data() {
        return {
            name: '',
            email: '',
            password: '',
            password_confirmation: '',
            lemail: '',
            lpassword: '',
            isHidden: false
        }
    },
    methods: {
        async regFun() {
            var string1 = "";
                if(this.email ==''){
                    string1 = string1+"Email required. ";
                }
                if(this.password ==''){
                    string1 = string1+"Password required. ";
                }
                if(this.name ==''){
                    string1 = string1+"Name required. ";
                }
                if(string1!=""){
                    alert(string1);
                    return
                }

            console.warn('Sign up', this.name, this.email, this.password);

            const data = {
                name: this.name,
                email: this.email,
                password: this.password,
                password_confirmation: this.password_confirmation
            };
            console.log("Request data . . . .", data);

            const requestOptions = {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(data)
            };

            var response = await fetch("http://127.0.0.1:8000/api/register", requestOptions);

            
            if(response.status == 201){
                var data2 = await response.json();
                localStorage.setItem('userInfo', JSON.stringify({ 'token': data2.token, 'user': data2.user_info}));
                this.$router.push({ name: 'ProfilePage' })
            }else{
                alert('Wrong Input!');
            }
        }
    },
    mounted() {
        let user = localStorage.getItem('userInfo')
        if (user) {
            this.$router.push({ name: 'ProfilePage' })
        }
    }
};
</script>

<style>
.link {
    text-decoration: none;
    color: seagreen;
}
</style>