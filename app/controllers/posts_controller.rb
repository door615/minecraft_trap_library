class PostsController < ApplicationController
  before_action :logged_in_admin, only: [:new, :create, :edit, :update]
    
  private def post_params
    params.require(:post).permit(:title, :feature_text, :avatar, :youtube_link, :blog_link,
                                  :text, tag_ids: [])
  end

  # 記事の一覧表示
  def index
    if @post == nil
    @posts = Post.page(params[:page]).per(10)
    end
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

  def search_page
  end

  def search
    
    keyword = params[:keyword]
    tag_ids = params[:tag_ids]
    
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

  def logged_in_admin
    unless logged_in?
      store_location
      redirect_to auth_url
    end
  end
end
