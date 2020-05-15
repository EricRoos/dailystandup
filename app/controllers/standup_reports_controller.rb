class StandupReportsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :create]


  # GET /teams/1
  # GET /teams/1.json
  def show
    @standup_report = StandupReport.find(params[:id])
  end

  # GET /teams/new
  def new
    @standup_report = StandupReport.build_report(TeamMember.last)
  end

  # POST /teams
  # POST /teams.json
  def create
    respond_to do |format|
      @standup_report = StandupReport.new(standup_report_params)
      @standup_report.team_member = TeamMember.where(user_id: current_user.id, team_id: @team.id).first
      if @standup_report.save
        format.html { redirect_to @team, notice: 'Standup Report was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:team_id])
    end

    # Only allow a list of trusted parameters through.
    def standup_report_params
      params.require(:standup_report).permit(survey_responses_attributes: [ :survey_question_id, :answer ] )
    end
end
