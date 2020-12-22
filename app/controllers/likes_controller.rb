class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user_id: current_user.id, post_id: @post.id)
    Notification.create(user_id:current_user.id, text:'like') #для создания уведомления
    render json: {not_count: current_user.notifications.count, count: @post.likes.count}
  end

end
