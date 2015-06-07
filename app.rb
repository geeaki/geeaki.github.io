$:.unshift File.dirname(__FILE__)

require 'bundler/setup'
Bundler.require(:default)
require 'yaml'

use Rack::Static, :urls => ['/images', '/javascripts']

helpers do
  def config_path
    "#{settings.root}/config"
  end

  def request_page_name
    request.path_info.scan(%r[^/(\w+)/]).flatten.first || 'index'
  end

  def page page_name = nil
    page_name ||= request_page_name
    File.read("#{settings.root}/pages/#{page_name}.md")
  end

  def markdown markdown_text
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
    renderer.render(markdown_text)
  end
end

get '/index.html' do
  slim :index
end

get '/events/index.html' do
  hash_events = YAML.load_file("#{config_path}/events.yml")
  slim :events, locals: { events: hash_events.map{|e| OpenStruct.new(e) } }
end

get '/links/index.html' do
  slim :links
end

get '/broadcast/index.html' do
  slim :broadcast
end

get '/jobs/index.html' do
  slim :jobs
end

get '/stylesheets/style.css' do
  scss :style, views: 'stylesheets'
end
