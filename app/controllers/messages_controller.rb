class MessagesController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @channel = Channel.find(params[:channel_id])
    redirect_to team_channel_path(@team, @channel)
  end

  def new
    @team = Team.find(params[:team_id])
    @channel = Channel.find(params[:channel_id])
    @message = Message.new
  end

  def create
    @team = Team.find(params[:team_id])
    @channel = Channel.find(params[:channel_id])
    message_params = params.require(:message).permit(:content)
    @message = Message.new(message_params)
    @message.channel = @channel
    @message.creator = current_user
    if @message.save
      redirect_to team_channel_path(@team, @channel), notice: 'Yes'
    else
      redirect_to new_team_channel_message_path(@team, @channel), notice: 'No'
    end
  end
end
