class MessagesController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @channel = Channel.find(params[:channel_id])
    respond_to do |format|
      format.html { redirect_to team_channel_path(@team, @channel) }
      format.js   { render json: @messages }
    end
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

    respond_to do |format|
      if @message.save
        format.html { redirect_to team_channel_path(@team, @channel), notice: 'Yes' }
        format.js   { render json: @message, include: [:creator], status: :created }
      else
        format.html { redirect_to new_team_channel_message_path(@team, @channel), notice: 'No' }
        format.js   { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
end
