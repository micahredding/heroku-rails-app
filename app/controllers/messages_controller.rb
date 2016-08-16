class MessagesController < ApplicationController
  before_action :set_channel_and_team

  def index
    @messages = @channel.messages
    @message = Message.new
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @messages }
    end
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.creator = current_user
    @message.channel = @channel
    respond_to do |format|
      if @message.save
        format.html { redirect_to team_channel_messages_path(@team, @channel), notice: 'Success' }
        format.json { render json: @message, include: [:creator], status: :created }
      else
        format.html { redirect_to new_team_channel_message_path(@team, @channel), notice: 'Failed' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def message_params
      params.require(:message).permit(:content)
    end

    def set_channel_and_team
      @channel = Channel.find(params[:channel_id])
      @team = Team.find(params[:team_id])
    end
end
