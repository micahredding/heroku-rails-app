class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    team_params = params.require(:team).permit(:name, :visibility)
    @team = Team.new(team_params)
    @team.creator = current_user
    if @team.save
      redirect_to team_path(@team), notice: 'Successfully created team'
    else
      redirect_to new_team_path(@team), error: 'Unable to create team'
    end
  end

  def update
    team_params = params.require(:team).permit(:name, :visibility)
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to team_path(@team), notice: 'Successfully updated team'
    else
      redirect_to edit_team_path(@team), error: 'Unable to update team'
    end
  end
end
