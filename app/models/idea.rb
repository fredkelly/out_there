class Idea < ActiveRecord::Base
  belongs_to :user
  acts_as_votable

  default_scope -> { order('created_at DESC') }

  def score
    votes_for.any? ? votes_for.up.count.to_f / votes_for.count : 0.0
  end
end
