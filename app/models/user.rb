class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages, class_name: 'Message', foreign_key: 'creator_id'
  has_many :read_messages, class_name: 'Message', through: 'message_readers'
  has_many :created_teams, class_name: 'Team', foreign_key: 'creator_id'
  has_many :teams, class_name: 'Team', through: 'team_members'
  has_many :created_channels, class_name: 'Channel', foreign_key: 'creator_id'
  has_many :channels, class_name: 'Channel', through: 'channel_members'
end
