require_relative 'tag'

class Link
  include DataMapper::Resource

  has n, :tags, :through => Resource

  property :id, Serial
  property :url, String
  property :title, String

  def print_tags
    tag_string = ''
    tags.each do |tag|
      tag_string << tag.name
    end
    tag_string
  end

  def split_tag_input(tag_input)
    tag_input.split(',').map!{|tag| tag.strip}
  end
end
