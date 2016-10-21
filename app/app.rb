ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative "models/data_mapper_setup"
require_relative 'models/link'
require_relative 'models/bookmark'

class BookmarkManager < Sinatra::Base

  database_setup
  enable :sessions

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

  get '/tags/:name' do
    @search_tag = params[:name]
    p params[:name]
    @bookmark = Bookmark.new
    @links = Link.all
    @filter_links = @links.select { |link| link.tags.each { |tag| tag.name == @search_tag } }
    erb :filter_by_tags
  end


  run! if app_file == $0
end
