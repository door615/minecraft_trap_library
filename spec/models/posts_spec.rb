require 'rails_helper'

RSpec.describe "Post", type: :model do
  let(:post) {Post.new(title: "ほげほげトラップ", feature_text: "ほげほげ",)}

  it "postが有効であること" do
    expect(post).to be_valid
  end

  it "titleが必須であること" do
    post.title = "   "
    expect(post).not_to be_valid
  end

  it "feature_textが必須であること" do
    post.feature_text = "   "
    expect(post).not_to be_valid
  end
end
