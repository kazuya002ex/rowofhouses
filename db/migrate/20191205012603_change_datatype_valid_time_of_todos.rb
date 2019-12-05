class ChangeDatatypeValidTimeOfTodos < ActiveRecord::Migration[5.2]
  def change
    change_column :todos, :valid_time, :date
  end
end
