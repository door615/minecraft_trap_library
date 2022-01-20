class PostsController < ApplicationController
  #newとeditとadd_tagは現在は管理人限定なので、パスワード認証機能をつけています
  before_action :logged_in_admin, only: [:new, :create, :edit, :update, :add_tag, :create_tag]
    
  #記事を作成するときのストロングパラメーター
  #title:記事のタイトル　feature_text:記事の本文　avatar:画像　youtube_link:埋め込みリンク
  #blog_url:webサイトのurl　text:分かりずらいですが、注釈などのためのカラムです。
  #tag_ids:タグのidの配列
  private def post_params
    params.require(:post).permit(:title, :feature_text, :avatar, :youtube_link, :blog_link,
                                  :text, tag_ids: [])
  end

  #タグを追加するときのストロングパラメーター
  private def tag_params
    params.permit(:name)

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

  #タグの追加をします。 ページ上にURLはありません
  def add_tag
    @tag = Tag.new
  end

  #タグの追加をします
  def create_tag

    @tag = Tag.new(tag_params)

    if @tag.save
      flash.now[:success] = "タグを追加しました！"
      render 'add_tag'
    else
      flash.now[:danger] = "タグの追加に失敗しました"
      render 'add_tag'
    end

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
