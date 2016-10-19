require_relative 'tag'

class Link
  include DataMapper::Resource

  has n, :tags, :through => Resource

  property :id, Serial
  property :url, String
  property :title, String

  def tag_string
    string = ''
    tags.each{|tag| string << tag.name}
    string
  end

  def split_tag_input(tag_input)
    tag_input.split(',').map!{|tag| tag.strip}
  end
end
