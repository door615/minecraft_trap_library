require 'rails_helper'

RSpec.describe "Tag", type: :model do
  let(:tag) {Tag.new(name: "ほげ")}

  it "tagが有効であること" do
    expect(tag).to be_valid
  end

  it "nameが必須であること" do
    tag.name = "   "
    expect(tag).not_to be_valid
  end

end
