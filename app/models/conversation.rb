class Conversation < ApplicationRecord
  validates_uniqueness_of :sender_id, :scope => :recipient_id
end
