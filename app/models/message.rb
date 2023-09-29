
class Message < ApplicationRecord
  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true

  validates :content, presence: true

  scope :unread, -> { where(read: false) }
end
