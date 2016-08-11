class ChannelsController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @channels = @team.channels
  end

  def show
    @channel = Channel.find(params[:id])
    @team = Team.find(params[:team_id])
  end

  def new
    @team = Team.find(params[:team_id])
    @channel = Channel.new
    @channel.team = @team
  end

  def edit
    @channel = Channel.find(params[:id])
    @team = Team.find(params[:team_id])
  end

  def create
    channel_params = params.require(:channel).permit(:name, :visibility)
    @channel = Channel.new(channel_params)
    @team = Team.find(params[:team_id])
    @channel.team = @team
    @channel.creator = current_user
    if @channel.save
      redirect_to team_channel_path(@team, @channel), notice: 'Yay!'
    else
      redirect_to new_team_channel_path(@team, @channel), notice: 'Not quite'
    end
  end

  def update
    channel_params = params.require(:channel).permit(:name, :visibility)
    @channel = Channel.find(params[:id])
    @team = Team.find(params[:team_id])
    if @channel.update(channel_params)
      redirect_to team_channel_path(@team, @channel), notice: 'Yay!'
    else
      redirect_to edit_team_channel_path(@team, @channel), notice: 'No'
    end
  end
end
