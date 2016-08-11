class Team < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :team_memberships
  has_many :members, class_name: 'User', through: 'team_memberships', source: 'user'
  has_many :channels
end
