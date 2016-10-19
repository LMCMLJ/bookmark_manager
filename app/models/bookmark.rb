class Bookmark

  def initialize
  end

  def add_tags
  end

  def create_link
  end

  def split_tag_input(tag_input)
    tag_input.split(',').map!{|tag| tag.strip}
  end

  def tags_to_string(tags)
    string = ''
    tags.each{|tag| string << tag.name + ' '}
    string
  end

end
