require 'rubygems'
require 'sinatra/base'
require 'sass'
require 'slim'

class SassEngine < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/assets/sass'

  get '/stylesheets/*.css' do
    filename = params[:splat].first
    sass filename.to_sym
  end
end

class TestSite < Sinatra::Base
  use SassEngine
  
  set :bind, '0.0.0.0'
  set :views, File.dirname(__FILE__) + '/views'
  set :public_dir, File.dirname(__FILE__) + '/public'

  get '/' do
      @page = "index"
      slim :index
  end

  get '/about' do
      @page = "about"
      slim :about
  end

  get '/resources' do
      @page = "resources"
      slim :resources
  end

  get '/websites' do
      @page = "websites"
      slim :websites
  end
end

TestSite.run!