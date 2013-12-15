$:.unshift File.dirname(__FILE__)

require 'bundler/setup'
Bundler.require(:default)

get '/index.html' do
  'test'
end
