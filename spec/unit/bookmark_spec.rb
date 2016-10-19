require 'spec_helper'

describe Bookmark do
  subject(:bookmark) {described_class.new}
  let(:tag) { double 'tag' }

  before :each do
    allow(tag).to receive(:name).and_return('#beer')
    @tags = [tag, tag, tag]
  end

  describe '#add_tags' do
    it 'creates tags out of a string' do
      expect(bookmark.add_tags('#beer, #pingpong, #cake')).to be_truthy
    end
  end

  describe '#create_link' do
    it 'creates a new link instance' do
      link = bookmark.create_link('http://google.com', 'google')
      expect(link).to be_an_instance_of(Link)
    end
  end

  describe '#split_tag_input' do
    it 'splits a string into an array' do
      expect(bookmark.split_tag_input('#beer, #horsies, #pingpong')).to eq(['#beer', '#horsies', '#pingpong'])
    end
  end

  describe '#tags_to_string' do
    it 'returns string of tags belonging to the link' do
      expect(bookmark.tags_to_string(@tags)).to eq('#beer #beer #beer ')
    end
  end
end
