require 'sinatra/base'
require './lib/link'

class BookmarkManager < Sinatra::Base
  get "/" do

    erb :index
  end
end
