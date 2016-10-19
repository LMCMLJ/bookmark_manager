ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative "models/data_mapper_setup"
require_relative 'models/link'

class BookmarkManager < Sinatra::Base


  get "/" do
    @links = Link.all
    erb :index
  end

  get "/add" do
    erb :add
  end

  post "/" do
    Link.create(url: params[:url], title: params[:title])
    redirect "/"
  end


  run! if app_file == $0
end
