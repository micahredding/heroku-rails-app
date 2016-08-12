class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update]
  before_action :set_team

  def show
  end

  def new
    @channel = Channel.new
  end

  def edit
  end

  def index
    @channels = @team.channels
  end

  def create
    @channel = Channel.new(channel_params)
    @channel.team = @team
    @channel.creator = current_user
    if @channel.save
      redirect_to team_channel_path(@team, @channel), notice: 'Success!'
    else
      redirect_to new_team_channel_path(@team), notice: 'Error!'
    end
  end

  def update
    if @channel.update(channel_params)
      redirect_to team_channel_path(@team, @channel), notice: 'Successful update'
    else
      redirect_to edit_team_channel_path(@team, @channel), notice: 'Failure to update'
    end
  end


  private
    def set_channel
      @channel = Channel.find(params[:id])
    end

    def set_team
      @team = Team.find(params[:team_id])
    end

    def channel_params
      params.require(:channel).permit(:name, :visibility)
    end

end
