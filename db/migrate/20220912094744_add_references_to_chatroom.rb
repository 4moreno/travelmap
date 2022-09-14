class AddReferencesToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :sender
    add_reference :chatrooms, :receiver
  end
end
