ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative "models/data_mapper_setup"
require_relative 'models/link'
require_relative 'models/bookmark'

class BookmarkManager < Sinatra::Base

  database_setup

  get "/" do
    @bookmark = Bookmark.new
    @links = Link.all
    erb :index
  end

  get "/add" do
    erb :add
  end

  post "/" do
    bookmark = Bookmark.new
    bookmark.create_link(params[:url], params[:title])
    bookmark.add_tags(params[:tags])
    redirect "/"
  end


  run! if app_file == $0
end
