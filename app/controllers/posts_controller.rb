class PostsController < ApplicationController
  #newやeditは現在は管理人限定なので、パスワード認証機能をつけています
  before_action :logged_in_admin, only: [:new, :create, :edit, :update]
    
  #記事を作成するときのストロングパラメーター
  private def post_params
    params.require(:post).permit(:title, :feature_text, :avatar, :youtube_link, :blog_link,
                                  :text, tag_ids: [])
  end

  # 記事の一覧表示と検索結果の表示をします。
  def index
    #検索ページからここに来たときは@postがすでにあるので、
    #@postに値を入れることはしません
    if @post == nil
    @posts = Post.page(params[:page]).per(10)
    end
  end

  # 記事の表示をします
  def show
    @post = Post.find(params[:id])
  end

  # 記事の作成をします。ページ上にURLはありません
  def new 
    @post = Post.new
  end

  # 記事の登録をします
  def create
      
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end

      
  end

  # 記事の編集をします。ページ上にURLはありません
  def edit
    @post = Post.find(params[:id])
  end

  # 記事の更新をします
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  # 記事の削除をします
  def destroy
  end

  #検索フォームを書いているページです
  def search_page
  end

  def search
    
    keyword = params[:keyword]
    tag_ids = params[:tag_ids]
    
    #フォームに何も入力しなかったとき、keyword = "", tag_ids = [""]となっていたので
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
    render 'index'
    
  end

  #セッションを用いた管理人としてログインをするメソッド
  def logged_in_admin
    unless logged_in?
      #このメソッドを発動したときのページを覚えておくメソッドです
      #ログインするときにnewとeditから来た時はそこに戻ります。
      #それ以外ではホーム画面に戻ります
      store_location
      #ログイン画面に遷移させます
      redirect_to auth_url
    end
  end
end
