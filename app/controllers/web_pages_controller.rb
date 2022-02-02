class WebPagesController < ApplicationController
  def home
  end

  #検索フォームを書いているページです
  def search_page
  end

  def search
    
    keyword = params[:keyword]
    tag_ids = params[:tag_ids]
    
    #ifの条件式の部分はフォームに何も入力しなかったとき、keyword = "", tag_ids = [""]となっていたので
    #このような書き方になってしまいました...
    #もっとましな書き方にできるようにしたいです

    #検索フォームにキーワードとタグが両方とも入力されていたら、キーワードのあいまい検索
    #とタグ検索をAND検索します。
    if keyword != "" && tag_ids != [""]
      posts = Post.search(keyword).tag_search(tag_ids)
      @posts = Kaminari.paginate_array(posts).page(params[:page]).per(10)

    elsif keyword != ""  
      @posts = Kaminari.paginate_array(Post.search(keyword)).page(params[:page]).per(10)

    elsif tag_ids != [""]
      @posts = Kaminari.paginate_array(Post.tag_search(tag_ids)).page(params[:page]).per(10)

    else 
      @posts = Post.page(params[:page]).per(10)
      
    end
    render 'posts/index'
    
  end

  
  #ここから下はサイドバーにあるリンクに対応するコントローラーです
  #記事の検索方法は改善が必要です
  
  #このサイトについて
  def about
  end

  #プライバシーポリシーを書いています
  def privacy
  end

  #利用規約を書いています
  def riyoukiyaku
  end

  #新着記事
  def new_posts
    #未完成
  end

  #連絡先はこちら
  def contact
  end

  #タグで探す　java版
  def java
    @posts = Kaminari.paginate_array(Post.tag_search(["", "1"])).page(params[:page]).per(10)
  end

  #タグで探す　統合版
  def bedrock
    @posts = Kaminari.paginate_array(Post.tag_.search(["", "2"])).page(params[:page]).per(10)
  end

  #タグで探す　java/統合版
  def java_BE
    @posts = Kaminari.paginate_array(Post.tag_.search(["", "3"])).page(params[:page]).per(10)
  end

  #トラップで探す　天空トラップタワー
  def ttt
    @posts = Kaminari.paginate_array(Post.search("天空トラップタワー")).page(params[:page]).per(10)
  end

  #トラップで探す　クリーパートラップ
  def creeper
    @posts = Kaminari.paginate_array(Post.search("クリーパートラップ")).page(params[:page]).per(10)
  end

  #トラップで探す　ゴーレムトラップ
  def golem
    @posts = Kaminari.paginate_array(Post.search("ゴーレムトラップ")).page(params[:page]).per(10)
  end

end
