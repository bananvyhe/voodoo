const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const vuetify = require('./loaders/vuetify')
 
// options.additionalData = `@import "app/javascript/stylesheets/scss/_variables.scss"`
 
const sassLoader = environment.loaders.get('sass')
const sassLoaderConfig = sassLoader.use.find(function(element) {
  return element.loader == 'sass-loader'
})
const options = sassLoaderConfig.options
options.implementation = require('sass')
options.additionalData = `@import "app/javascript/stylesheets/scss/_variables.scss"`

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.loaders.prepend('vuetify', vuetify)
module.exports = environment
