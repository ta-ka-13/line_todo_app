const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.append('Provide',new webpack.ProvidePlugin({
  $:'jquery',
  jQuery: 'jquery',
  Popper:['poper.js','default']

}))

module.exports = environment
