class AddParticularToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :private, :boolean
  end
end
