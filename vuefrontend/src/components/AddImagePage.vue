<template>
    <h1>Add an image</h1>
    <br>
    <br>
    <div class="form_div">
        <input @input="fetchChangeValue" v-model="url" type="text" placeholder="Enter Image URL" /><br>
        <img :src="url = this.url" width = "300" height = "250" />
        <button v-on:click="logFun">Submit</button>
    </div>
</template>
<script>

export default {
    name: 'AddImagePage',
    methods: {
        fetchChangeValue() {
            console.log(this.url);
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
