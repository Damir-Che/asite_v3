class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token


  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    render json: { success: 'удаленно', count: current_user.notifications.count}
  end

  private

  def notification_params
    params.require(:notification).permit( :text )
  end
end
