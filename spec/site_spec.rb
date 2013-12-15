require File.expand_path('../../app', __FILE__)
require 'sitespec'

Sitespec.configuration.application = Sinatra::Application

describe 'This site' do
  include Sitespec

  it do
    get '/index.html'
  end
end
