class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = current_user.teams
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    #@standup_reports = StandupReport
    #  .includes(team_member: [ :user ], survey_responses: [ :survey_question ])
    #  .where(team_member_id: @team.team_members)
    #  .order(created_at: :desc)
    redirect_to team_activities_path(@team)
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  def edit
    @side_bar_option = 'manage-team'
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.build_survey.populate_questions
    new_team_member = TeamMember.new(user: current_user)
    @team.team_members << new_team_member
    new_team_member.add_role(:owner)
    @team.save
    respond_to do |format|
      if @team.persisted?
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def current_team_member
    @current_team_member ||= TeamMember.where(team_id: @team.id, user_id: current_user.id).first
  end
  helper_method :current_team_member

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:id, :name, survey_attributes: [ :id, survey_questions_attributes: [:text, :id, :_destroy] ])
    end
end
