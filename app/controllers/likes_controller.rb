class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user_id: current_user.id, post_id: @post.id)
    Notification.create(user_id:current_user.id, text:'like') #для создания уведомления
    render json: {notification: current_user.notifications.count, like: @post.likes.count} #передает в jq(ajax) данные
  end

end
