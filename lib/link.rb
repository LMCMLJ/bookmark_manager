require "data_mapper"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager")

class Link
  include DataMapper::Resource

  attr_reader :url

end
