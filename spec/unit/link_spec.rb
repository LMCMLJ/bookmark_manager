require 'spec_helper'

describe Link do
  subject(:link) {described_class.new}
  it "has a url" do
    expect(subject).to respond_to(:url)
  end
end
