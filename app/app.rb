ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative "models/data_mapper_setup"
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  database_setup

  get "/" do
    @links = Link.all
    erb :index
  end

  get "/add" do
    erb :add
  end

  post "/" do
    link = Link.create(url: params[:url], title: params[:title])
    tags = link.split_tag_input(params[:tags])
    tags.each do |tag_name|
      tag = Tag.first_or_create(:name=>tag_name)
      LinkTag.create(:link => link, :tag => tag)
    end
    redirect "/"
  end


  run! if app_file == $0
end
