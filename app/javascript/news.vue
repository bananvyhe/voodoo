<template>
  <div> 
    <div v-for="(item, index) in alld" >
      <v-row class="row">
        <v-col
          class="d-flex flex-row mb-6 "
          :color="$vuetify.theme.dark ? 'grey darken-3' : 'grey lighten-4'"
          flat
          tile>
            <v-col 
            cols=3  
            v-bind:style="{backgroundImage: 'url('+ item.imglink}"
            class="pa-2 d-flex align-stretch pic"
            outlined
            tile>
            </v-col>  
            {{item.head}}

            {{item.content}}        
            {{item.datepost}}
            <!-- {{item.link}} -->
        </v-col>
      </v-row>
    </div>
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
.row {
  height: 14em;
}
.pic {
  background-position: center;
  background-size: cover; 
  background-repeat: no-repeat;
}
</style>