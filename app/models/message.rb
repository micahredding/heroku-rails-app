class Message < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :channel
  has_many :message_readerships
  has_many :readers, class_name: 'User', through: 'message_readerships', source: 'user'
end
