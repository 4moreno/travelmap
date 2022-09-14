class Chatroom < ApplicationRecord
  belongs_to :event
  has_many :messages, dependent: :destroy
  # belongs_to :sender, class_name: "User"
  # belongs_to :receiver, class_name: "User"
 
end
