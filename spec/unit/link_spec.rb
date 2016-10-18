require 'spec_helper'

describe Link do
  subject(:link) {described_class.new}
  it "has a url" do
    expect(subject).to respond_to(:url)
  end

  it "has an id" do
    expect(subject).to respond_to(:id)
  end

  it "has a title" do
    expect(subject).to respond_to(:title)
  end
end
