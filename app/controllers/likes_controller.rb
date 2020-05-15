class LikesController < ApplicationController

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

end
