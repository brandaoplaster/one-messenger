class ChatsController < ApplicationController
    
    def index
        @users = User.joins(:sent).where(messages: { receiver_id: current_user })
        @user += User.joins(:received).where(messages: { sender_id: current_user })
        @user.uniq!
    end

    def show
        @user = User.find(params[:id])
    end
end
