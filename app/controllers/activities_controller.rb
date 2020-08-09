class ActivitiesController < ApplicationController
  before_action :set_team

  # GET /team_members
  # GET /team_members.json
  def index
    @activities = fetch_activities
  end

  def show
    @activity = fetch_activities.where(id: params[:id]).first
  end

  private

    def fetch_activities
      @team.activities
        .includes(:actor)
        .where("created_at > ?", Date.today - 14.days)
        .order(created_at: :desc)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:team_id])
    end
end
