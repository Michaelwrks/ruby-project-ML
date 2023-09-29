# class MessagesController < ApplicationController
#   before_action :set_user
#     def new
#         @user = User.find(params[:user_id])
#         @creator_artists = CreatorArtist.all
#         @message = Message.new
#       end
    
#       def create
#        @user = User.find(params[:user_id])
#        @message = @user.messages.build(message_params)

#       if @message.save
#         flash[:notice] = 'Message sent successfully.'
#         redirect_to root_path
#       else
#         flash.now[:alert] = 'Error sending message.'
#         render :new
#       end
#       end
# end
# class MessagesController < ApplicationController
#   before_action :set_user, only: [:new, :create]

#   def new
#     @user = User.find(params[:user_id])
#     @creator_artists = CreatorArtist.all
#     @message = Message.new
#   end

#   def create
#     @message = @user.messages.build(message_params)
#     # rest of your create action
#     if @message.save
#       flash[:notice] = 'Message sent successfully.'
#       redirect_to root_path
#     else
#       render :new
#     end
#   end

#   private

#   def set_user
#     @user = User.find(params[:user_id])
#   end

#   def message_params
#     params.require(:message).permit(:receiver_id, :content)
#   end
# end


class MessagesController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def new
    @creator_artists = CreatorArtist.all
    @message = Message.new
  end

  def create
    @message = @user.sent_messages.build(message_params)
    @message.receiver = CreatorArtist.find(params[:message][:receiver_id])
    @message.sender = current_user
    if @message.save
      puts "message send"
      flash[:notice] = 'Message sent successfully.'
      redirect_to root_path
    else
      puts "message not send"
      flash[:alert] = 'Error sending message.'
      render :new
    end
  end


  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def message_params
    params.require(:message).permit(:content, :receiver_id)
  end
end
