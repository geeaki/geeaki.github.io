require File.expand_path('../../app', __FILE__)
require 'sitespec'

Sitespec.configuration.application = Sinatra::Application

describe 'This site' do
  include Sitespec

  it do
    get '/index.html'
    get '/stylesheets/style.css'
    get '/images/geeaki_living.jpg'
  end
end
