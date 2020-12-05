class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = 'Статья создана!'
      redirect_to @post
    else
      flash.now[:error] = 'Ошибка!'
      render 'post/new'
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
      render 'post/edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Статья удалена!'
    redirect_to posts_path
  end



  private

  def post_params
    params.require(:post).permit(:title, :body )
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
