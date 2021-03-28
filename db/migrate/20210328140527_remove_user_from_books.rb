class RemoveUserFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_reference :books, :user, foreign_key: true
  end
end
