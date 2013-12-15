$:.unshift File.dirname(__FILE__)

require 'bundler/setup'
Bundler.require(:default)

get '/index.html' do
  slim :index
end

get '/stylesheets/style.css' do
  scss :style, views: 'stylesheets'
end
