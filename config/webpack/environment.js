const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const scss = require('./loaders/scss')
 
// options.additionalData = `@import "app/scss/variables.scss"`


environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.loaders.prepend('scss', scss)
module.exports = environment
