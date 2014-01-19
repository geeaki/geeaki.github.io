$:.unshift File.dirname(__FILE__)

require 'bundler/setup'
Bundler.require(:default)
require 'yaml'

use Rack::Static, :urls => ['/images']

helpers do
  def config_path
    "#{settings.root}/config"
  end

  def pages_path
    "#{settings.root}/pages"
  end

  def markdown markdown_text
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
    renderer.render(markdown_text)
  end
end

get '/index.html' do
  path = "#{pages_path}/index.md"
  slim :index, locals: { page: File.read(path) }
end

get '/events/index.html' do
  hash_events = YAML.load_file("#{config_path}/events.yml")
  slim :events, locals: { events: hash_events.map{|e| OpenStruct.new(e) } }
end

get '/links/index.html' do
  path = "#{pages_path}/links.md"
  slim :links, locals: { page: File.read(path) }
end

get '/stylesheets/style.css' do
  scss :style, views: 'stylesheets'
end
