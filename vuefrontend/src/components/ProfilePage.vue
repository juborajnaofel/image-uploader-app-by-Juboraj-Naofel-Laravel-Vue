<template>

    <div id="title">
        <h2>Welcome, {{user_name}}</h2>
        <br>
        <br>
        <br>
    <router-link class="btn_menu" to="/add-image">Add image</router-link> &nbsp;
    <a class="btn_menu" v-on:click="logoutFun">Logout</a>
    </div>
    <br>
    <br>
    <br>
    <br>
    <div id="imgWrap">
    {{noImage}}
    <span id="list_images" v-for="item in items" v-bind:key="item.id">
         <img :src="'http://127.0.0.1:8000/uploads/'+item.url" width="220" height="250" />
    </span>
    </div>
</template>
<script>

export default {
    name: 'ProfilePage',
    data() {
        return {
            items: [],
            user_name: '',
            noImage: ''
        }
    },
    methods: {
        async logoutFun() {
            var arrayName = '';
            var bearer = 'Bearer ' 
            var getJson = localStorage.getItem('userInfo')
            if(getJson){
                arrayName = JSON.parse(getJson)
                bearer = bearer + arrayName.token;            
            }

            const requestOptions = {
                method: "post",
                headers: { "Content-Type": "application/json", 'Authorization': bearer },
            };

            var response = await fetch("http://127.0.0.1:8000/api/logout", requestOptions);


            if(response.status == 200){
                localStorage.removeItem('userInfo');
                this.$router.push({ name: 'LoginForm' })
            }
        },
    },
    async mounted() {
        let user = localStorage.getItem('userInfo')
        if (!user) {
            this.$router.push({ name: 'RegisterForm' })
        }
        var arrayName = '';
        var bearer = 'Bearer ' 
        var getJson = localStorage.getItem('userInfo')
        if(getJson){
            arrayName = JSON.parse(getJson)
            bearer = bearer + arrayName.token;            
        }

        const requestOptions = {
            method: "GET",
            headers: { "Content-Type": "application/json", 'Authorization': bearer },
        };

        var response = await fetch("http://127.0.0.1:8000/api/load-user-images", requestOptions);


        if(response.status == 200){
            var data2 = await response.json();
            this.items = data2.images;
            if(data2.images.length === 0){
                this.noImage = "No images uploaded";
            }else{
                this.noImage ='';
            }
        }
        
        if(getJson){
            arrayName = JSON.parse(getJson)
            this.user_name = arrayName.user.name;
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
#imgWrap{
    margin-left: auto;
    margin-right: auto;
    width: 50%;
}
#list_images img{
    height: 200px;
    width: 200px;
    margin: 10px;
    border-radius: 10px;
}
.btn_menu {
    text-decoration: none;
    background-color: rgb(255, 255, 255);
    color: seagreen;
    padding: 10px;
    border-radius: 5px;
}
.btn_menu:hover {
    text-decoration: none;
    background-color: rgb(255, 255, 255);
    color: rgb(43, 59, 50);
    padding: 10px;
    border-radius: 5px;
    outline: 1px solid seagreen;
}
</style>