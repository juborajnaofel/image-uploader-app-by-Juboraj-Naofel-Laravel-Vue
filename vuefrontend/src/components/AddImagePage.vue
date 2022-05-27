<template>
    <div id="title">
        <h1>Image Uploader System</h1>
        <h4>by I.E.U. Juboraj Naofel</h4>
        <br>
        <br>
        <br>
        <router-link class="btn_menu" to="/profile">Home</router-link>
    </div>
    <br>
    <br>
    <br>
    <h4>Add an image</h4>
    <div class="form_div_add">
        <input @input="fetchChangeValue" v-model="url" type="text" placeholder="Enter Image URL" /><button
            v-on:click="upload">Submit</button><br>
        <img v-show="showImg" :src="urlimg" width="220" height="250" />

    </div>
</template>
<script>
function filecheck(urlToFile) {
    var xhr = new XMLHttpRequest();
    xhr.open('HEAD', urlToFile, false);
    xhr.send();
    return xhr.status !== 404;
}

export default {
    name: 'AddImagePage',
    data() {
        return {
            urlimg: '',
            showImg: false
        }
    },
    methods: {
        async upload() {
            if(this.showImg == false){
                alert('The url is incorrect. No image found in this url. Please try another url.')
                return
            }
            alert('Uploading Started');

            const data = {
                url: this.urlimg,
            };
            console.log("Request data . . . .", data);

            var arrayName = '';
            var bearer = 'Bearer ' 
            var getJson = localStorage.getItem('userInfo')
            if(getJson){
                arrayName = JSON.parse(getJson)
                bearer = bearer + arrayName.token;            
            }


            const requestOptions = {
                method: "POST",
                headers: { "Content-Type": "application/json", 'Authorization': bearer },
                body: JSON.stringify(data)
            };

            var response = await fetch("http://127.0.0.1:8000/api/upload/save", requestOptions);


            if (response.status == 201) {
                alert("Upload Successfull")
            }
            this.$router.push({ name: 'ProfilePage' })
        },
        fetchChangeValue() {
            this.urlimg = this.url;
            this.showImg = true;
            if (!filecheck(this.urlimg)) {
                this.showImg = false;
            }
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
.form_div_add input {
    display: block;
    margin-bottom: 2px;
    height: 20px;
    width: 400px;
    margin-left: auto;
    margin-right: auto;
    border-radius: 5px;
    border: 1px solid seagreen;
    padding: 10px;
}

.form_div_add button {
    border-radius: 5px;
    margin-left: auto;
    margin-right: auto;
    display: block;
    margin-bottom: 2px;
    height: 40px;
    width: 420px;
    padding: 10px;
    background-color: seagreen;
    color: white;
    border: 1px solid seagreen;
}

.form_div_add img {
    border-radius: 5px;
    margin-left: auto;
    margin-right: auto;
    display: block;
    margin-bottom: 2px;
    height: 300px;
    width: 400px;
    padding: 10px;
    color: white;
    border: 1px solid seagreen;
}
</style>
