require File.expand_path('../../app', __FILE__)
require 'sitespec/rspec'

describe 'This site', :sitespec do
  let(:app) { Sinatra::Application }

  %w[
    /index.html
    /stylesheets/style.css
    /javascripts/script.js
    /images/favicon.ico
    /images/logo.png
    /images/7wonders.jpg
    /images/drinkup_03.jpg
    /images/overlay_light_diagonal.png
  ].each do |path|
    describe "GET #{path}" do
      subject { get(path).status }
      it { is_expected.to eq 200 }
    end
  end
end
