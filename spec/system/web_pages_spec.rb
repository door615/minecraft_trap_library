require 'rails_helper'

RSpec.describe "WebPages", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "web_pages_controllerにあるページ上に期待するタイトルとディスクリプションが存在する" do

    let(:base_title) { "Minecraftトラップライブラリー" }
    let(:root_title) { "#{base_title} | マイクラのトラップを全てまとめました" }
    let(:title) { "#{page_title} | #{base_title}" }
    let(:base_description) { "数多あるマイクラのトラップをまとめました！
      java版用、統合版用、簡単に作れるものから最高効率のものまであらゆるトラップが
      揃っています。豊富なタグで分類しているのであなたの求めるトラップが見つかります！" }
    let(:description_with_trap) { "#{page_description}の一覧ページです。あなたが作りたい#{page_description}はどれですか？"}
    let(:description_with_version) {"#{page_description}のトラップ一覧ページです。あなたが作りたい#{page_description}のトラップはどれですか？"}
    let(:description_static_page) {"#{page_description}"}

    context "search_page" do
      let(:page_title) {"詳細検索"}
      let(:page_description) {"記事の詳細検索はこちら"}
      it "search_page" do
        visit search_page_path
        expect(page).to have_title title
        expect(page).to have_selector "meta[name=description][content='#{description_static_page}']", visible: false
      end
    end

    context "about" do
      let(:page_title) {"このサイトについて"}
      let(:page_description) {"このサイトがどのようなサイトかを説明するページ"}
      it "about" do
        visit about_path
        expect(page).to have_title title
        expect(page).to have_selector "meta[name=description][content='#{description_static_page}']", visible: false
      end
    end

    context "privacy" do
      it "privacy" do
        visit privacy_path
        expect(page).to have_title root_title
        expect(page).to have_selector "meta[name=description][content='#{base_description}']", visible: false
      end
    end

    context "riyoukiyaku" do
      it "riyoukiyaku" do
        visit riyoukiyaku_path
        expect(page).to have_title root_title
        expect(page).to have_selector "meta[name=description][content='#{base_description}']", visible: false
      end
    end

    # context "new_posts" do
    #   let(:page_title) {""}
    #   let(:page_description) {""}
    #   it "new_posts" do
    #     visit new_posts_path
    #     expect(page).to have_title 
    #     expect(page).to have_title 
    #   end
    # end

    context "contact" do
      let(:page_title) {"連絡先"}
      let(:page_description) {"管理人への連絡先はこちら"}
      it "contact" do
        visit contact_path
        expect(page).to have_title title
        expect(page).to have_selector "meta[name=description][content='#{description_static_page}']", visible: false
      end
    end

    context "java" do
      let(:page_title) {"Java版のトラップまとめ"}
      let(:page_description) {"Java版"}
      it "java" do
        visit java_path
        expect(page).to have_title title
        expect(page).to have_selector "meta[name=description][content='#{description_with_version}']", visible: false
      end
    end

    context "bedrock" do
      let(:page_title) {"統合版のトラップまとめ"}
      let(:page_description) {"統合版"}
      it "bedrock" do
        visit bedrock_path
        expect(page).to have_title title
        expect(page).to have_selector "meta[name=description][content='#{description_with_version}']", visible: false
      end
    end

    context "java_BE" do
      let(:page_title) {"Java版と統合版の両方で使えるトラップまとめ"}
      let(:page_description) {"Java版と統合版"}
      it "java_BE" do
        visit java_BE_path
        expect(page).to have_title title
        expect(page).to have_selector "meta[name=description][content='#{description_with_version}']", visible: false
      end
    end

    context "ttt" do
      let(:page_title) {"天空トラップタワーまとめ"}
      let(:page_description) {"天空トラップタワー"}
      it "ttt" do
        visit ttt_path
        expect(page).to have_title title
        expect(page).to have_selector "meta[name=description][content='#{description_with_trap}']", visible: false
      end
    end

    context "creeper" do
      let(:page_title) {"クリーパートラップまとめ"}
      let(:page_description) {"クリーパートラップ"}
      it "creeper" do
        visit creeper_path
        expect(page).to have_title title
        expect(page).to have_selector "meta[name=description][content='#{description_with_trap}']", visible: false
      end
    end

    context "golem" do
      let(:page_title) {"ゴーレムトラップまとめ"}
      let(:page_description) {"ゴーレムトラップ"}
      it "golem" do
        visit golem_path
        expect(page).to have_title title
        expect(page).to have_selector "meta[name=description][content='#{description_with_trap}']", visible: false
      end
    end
    
  end
end
