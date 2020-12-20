class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    Notification.create(user_id:current_user.id, text:'comment')#для создания уведомления

    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
