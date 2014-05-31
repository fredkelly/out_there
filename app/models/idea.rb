class Idea < ActiveRecord::Base
  belongs_to :user
  acts_as_votable

  def score
    votes_for.any? ? votes_for.up.size.to_f / votes_for.size : 0.0
  end
end
