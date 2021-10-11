<template>
  <div id="app">
    <v-app>
      <v-container>
        <v-main>
          <p>{{ message }}</p>          
        </v-main>
      </v-container>
    </v-app>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Voodoo invition"
    }
  }
}
</script>

<style scoped>
#app{
    background-color: #1a2b08;
  }
p {
  font-size: 1em;
  text-align: center;
  color: #999;
}
</style>
