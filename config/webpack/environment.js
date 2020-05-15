const { environment } = require('@rails/webpacker')

const webpack = require('webpack');

// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
      $: 'jquery',
      JQuery: 'jquery',
      jquery: 'jquery',
      jQuery: 'jquery',
  })
)
module.exports = environment
