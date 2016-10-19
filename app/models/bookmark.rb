class Bookmark

  attr_reader :link

  def add_tags(tags)
    tag_ary = split_tag_input(tags)
    create_tag_instance(tag_ary)
  end

  def create_link(url, title)
    @link = Link.create(url: url, title: title)
  end

  def split_tag_input(tag_input)
    tag_input.split(',').map!{|tag| tag.strip}
  end

  def tags_to_string(tags)
    string = ''
    tags.each{|tag| string << tag.name + ' '}
    string
  end

  def create_tag_instance(ary)
    ary.each do |tag_name|
      tag = Tag.first_or_create(:name=>tag_name)
      LinkTag.create(:link => link, :tag => tag)
    end
  end
end
