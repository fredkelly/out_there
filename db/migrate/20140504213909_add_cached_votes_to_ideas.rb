class AddCachedVotesToIdeas < ActiveRecord::Migration
  def self.up
    add_column :ideas, :cached_votes_total, :integer, :default => 0
    add_column :ideas, :cached_votes_score, :integer, :default => 0
    add_column :ideas, :cached_votes_up, :integer, :default => 0
    add_column :ideas, :cached_votes_down, :integer, :default => 0
    add_column :ideas, :cached_weighted_score, :integer, :default => 0
    add_index  :ideas, :cached_votes_total
    add_index  :ideas, :cached_votes_score
    add_index  :ideas, :cached_votes_up
    add_index  :ideas, :cached_votes_down
    add_index  :ideas, :cached_weighted_score

    # Uncomment this line to force caching of existing votes
    Idea.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :ideas, :cached_votes_total
    remove_column :ideas, :cached_votes_score
    remove_column :ideas, :cached_votes_up
    remove_column :ideas, :cached_votes_down
    remove_column :ideas, :cached_weighted_score
  end
end
