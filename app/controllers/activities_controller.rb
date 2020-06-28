class ActivitiesController < ApplicationController
  before_action :set_team

  # GET /team_members
  # GET /team_members.json
  def index
    @activities = @team.activities
      .includes(:actor)
      .order(created_at: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:team_id])
    end
end
