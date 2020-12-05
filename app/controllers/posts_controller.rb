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
      redirect_to @post
    else
      render 'post/new'
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to @post
    else
      render 'post/edit'
    end
  end

  def destroy
    @post.destroy
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
