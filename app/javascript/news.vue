<template>
  <div> 
    {{alld}}
  </div>
</template>
<script>
  import axios from 'axios'
  export default {
    data: function (){
      return {
        alld: ''
      }
    },
    mounted(){
        this.addBeer()
    },
    methods: {
      addBeer() {
       


        axios({
          method: 'get',
          url: '/news',
 
        }).then((response) => { 
          if (response.data){
                  console.log(response.data)
            this.alld = response.data
            
          }
        });
      }
    },

  }
</script>
<style scoped>
 
</style>