const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')

const webpack = require('webpack');
environment.loaders.prepend('erb', erb)
// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
      $: 'jquery',
      JQuery: 'jquery',
      jquery: 'jquery',
      jQuery: 'jquery',
  })
)
module.exports = environment
