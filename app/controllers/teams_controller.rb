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
    @team_members = @team.team_members.includes(:roles, :user)
    @current_team_member = @team_members.detect { |t| t.user == current_user }

    @standup_reports = StandupReport
        .where(team_member_id: @team.team_members)
        .order(created_at: :desc)

    if !Rails.cache.exist?(@team)
      @standup_reports = Rails.cache.fetch(@team) do
        @standup_reports = @standup_reports.includes(:team_member, survey_responses: [ :survey_question ] )
      end
    end
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.build_survey.populate_questions
    @team.save
    new_team_member = TeamMember.new(user: current_user)
    @team.team_members << new_team_member
    new_team_member.add_role(:owner)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name)
    end
end
