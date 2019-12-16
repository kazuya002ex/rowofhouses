class AddDoneTimeToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :done_time, :datetime
  end
end
