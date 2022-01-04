class PostsController < ApplicationController
    
  private def post_params
    params.require(:post).permit(:title, :feature_text, :avatar, :youtube_link, :blog_link,
                                  :text)
  end

  # 記事の一覧表示
  def index
    @posts = Post.page(params[:page]).per(2)
  end

  # 記事の表示
  def show
    @post = Post.find(params[:id])
  end

  # 記事の作成
  def new 
    @post = Post.new
  end

  # 記事の登録
  def create
      
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end

      
  end

  # 記事の編集
  def edit
  end

  # 記事の更新
  def update
  end

  # 記事の削除
  def destroy
  end
end
