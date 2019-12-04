class AddValidTimeToTodos < ActiveRecord::Migration[5.2]
  def change
  	add_column :todos, :valid_time, :datetime
  end
end
