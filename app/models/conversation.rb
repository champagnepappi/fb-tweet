class Conversation < ApplicationRecord
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'

  validates_uniqueness_of :sender_id, :scope => :recipient_id
end
