<template>
  <div id="app">
    <v-app>
      <v-container>
          <v-app-bar app>
            Новости из Кореи
          </v-app-bar>
        <v-main>

        <!--   <p>{{ message }}</p>    -->
          <news></news>       
        </v-main>
      </v-container>
    </v-app>
  </div>
</template>

<script>
import News from './news.vue'
export default {
  components: {
    'news': News
  },
  data: function () {
    return {
      message: "Voodoo invition"
    }
  }
}
</script>

<style scoped>
#app{
    
  }
 
</style>
