class WebPagesController < ApplicationController
  def home
  end

  def about
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
    #とタグ検索をAND検索します。取り出すデータの重複、一度にすべてのデータを取り出している
    #などの改善点があります。
    if keyword != "" && tag_ids != [""]
      array1 = Post.search(keyword)
      array2 = Tag.search(tag_ids)
      posts = array1 & array2
      posts.uniq!
      @posts = Kaminari.paginate_array(posts).page(params[:page]).per(10)

    elsif keyword != ""  
      @posts = Kaminari.paginate_array(Post.search(keyword)).page(params[:page]).per(10)

    elsif tag_ids != [""]
      @posts = Kaminari.paginate_array(Tag.search(tag_ids)).page(params[:page]).per(10)

    else 
      @posts = Post.page(params[:page]).per(10)
      
    end
    render 'posts/index'
    
  end
end
