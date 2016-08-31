class RemoveScreenNameColumnFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :screen_name
  end
end
