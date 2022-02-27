require 'rails_helper'

RSpec.describe "WebPages", type: :request do
  describe "web_pages_controllerにあるページが存在する" do

    it "search_page" do
      get search_page_path
      expect(response).to have_http_status(200)
    end

    it "about" do
      get about_path
      expect(response).to have_http_status(200)
    end

    it "privacy" do
      get privacy_path
      expect(response).to have_http_status(200)
    end

    it "riyoukiyaku" do
      get riyoukiyaku_path
      expect(response).to have_http_status(200)
    end

    #このページは未完成なのでこのテストはコメントアウトしてます
    # it "new_posts" do
    #   get new_posts_path
    #   expect(response).to have_http_status(200)
    # end

    it "contact" do
      get contact_path
      expect(response).to have_http_status(200)
    end

    it "java" do
      get java_path
      expect(response).to have_http_status(200)
    end

    it "bedrock" do
      get bedrock_path
      expect(response).to have_http_status(200)
    end

    it "java_BE" do
      get java_BE_path
      expect(response).to have_http_status(200)
    end

    it "ttt" do
      get ttt_path
      expect(response).to have_http_status(200)
    end

    it "creeper" do
      get creeper_path
      expect(response).to have_http_status(200)
    end

    it "golem" do
      get golem_path
      expect(response).to have_http_status(200)
    end

  end
end
