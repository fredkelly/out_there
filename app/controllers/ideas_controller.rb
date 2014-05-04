class IdeasController < ApplicationController
  respond_to :json

  def index
    # ideas not created by or voted on by the current_user
    @ideas = Idea.where.not(user_id: current_user.id) \
      .joins('LEFT OUTER JOIN votes ON votes.votable_id = ideas.id') \
      .where('votes.voter_id != ? OR votes.votable_id IS NULL', current_user.id) \
      .order('RANDOM()') \
      .limit(params[:limit])
  end

  def create
    @idea = current_user.ideas.build(idea_params)
    @idea.save

    respond_with @idea
  end

  def show
    @idea = Idea.find(params[:id])

    respond_with @idea
  end

  def vote
    @idea = Idea.find(params[:id])
    @idea.vote_by voter: current_user, vote: params[:vote]

    respond_with @idea
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :summary)
  end
end
