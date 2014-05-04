class User < ActiveRecord::Base
  has_many :ideas
  acts_as_voter
end
