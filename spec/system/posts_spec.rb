require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "ページ上に期待するURLがある" do

    it "root" do 
      visit "/"

      #ヘッダー画像のリンク
      expect(page).to have_link href: root_path

      #サイドバーのリンク
      expect(page).to have_link 'このサイトについて', href: about_path
      expect(page).to have_link '詳細検索', href: search_page_path
      expect(page).to have_link 'このサイトについて', href: about_path
      expect(page).to have_link '新着記事', href: new_pages_path
      expect(page).to have_link '連絡先はこちら', href: contact_path
      expect(page).to have_link 'java版', href: java_path
      expect(page).to have_link '統合版(Win10/PE/Switch/PS4/Xbox)', href: bedrock_path
      expect(page).to have_link 'java / 統合版(Win10/PE/Switch/PS4/Xbox)', href: java_BE_path
      expect(page).to have_link '天空トラップタワー', href: ttt_path
      expect(page).to have_link 'ゴーレムトラップ', href: golem_path
      expect(page).to have_link 'クリーパートラップ', href: creeper_path
     
     
    end
  end
end
