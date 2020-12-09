class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]


  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'Статья создана!'
      redirect_to @post
    else
      flash.now[:error] = 'Ошибка!'
      render 'posts/new'
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      flash[:success] = 'Статья обновлена!'
      redirect_to @post
    else
      flash.now[:error] = 'Ошибка!'
      render 'posts/edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Статья удалена!'
    redirect_to posts_path
  end

  def search
    @posts = Post.where("title LIKE ?", "%" + params[:q] + "%")
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :image )
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
