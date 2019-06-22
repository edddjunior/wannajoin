class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|

      t.integer :friender_id
      t.integer :friended_id
      t.boolean :accepted, default: false
      t.timestamps
    end
  end
end
