class LikesController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :create]

  def create
    respond_to do |format|
      @like = Like.new(like_params)
      if @like.save
        format.html { redirect_to @team, notice: 'Like was successfully created.' }
        format.json { render :show, status: :created, location: @team }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type).merge(team_member_id: current_team_member.id)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

  def current_team_member
    @current_team_member ||= TeamMember.where(team_id: @team.id, user_id: current_user.id).first
  end

end
