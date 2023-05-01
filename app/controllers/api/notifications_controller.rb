class NotificationsController < ApplicationController
    def index
        notifications = Notifications.all 
        render json: notifications
    end

    def create
        notification = Notification.new(notification_params)
        if notification.save
          render json: notification, status: :created
        else
          render json: { errors: notification.errors.full_messages }, status: :unprocessable_entity
        end
    end
      
    private
      
    def notification_params
        params.require(:notification).permit(:notification_type, :user_id, :answer_id, :question_id, :read)
    end
      
end
