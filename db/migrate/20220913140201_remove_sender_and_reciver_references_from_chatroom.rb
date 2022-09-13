class RemoveSenderAndReciverReferencesFromChatroom < ActiveRecord::Migration[7.0]
  def change
    remove_reference :chatrooms, :sender
    remove_reference :chatrooms, :receiver
  end
end
