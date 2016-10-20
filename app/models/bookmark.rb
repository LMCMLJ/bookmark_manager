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
    join_ary(tags.map {|tag| tag.name.to_s })
  end

  def join_ary(ary)
    ary.join(" ")
  end

  def create_tag_instance(ary)
    ary.each do |tag_name|
      tag = Tag.first_or_create(:name=>tag_name)
      LinkTag.create(:link => link, :tag => tag)
    end
  end
end
