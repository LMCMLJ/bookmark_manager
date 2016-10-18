require 'sinatra/base'
require './app/models/link'

class BookmarkManager < Sinatra::Base
  get "/" do

    erb :index
  end
end
