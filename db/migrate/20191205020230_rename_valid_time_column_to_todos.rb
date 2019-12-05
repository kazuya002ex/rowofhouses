class RenameValidTimeColumnToTodos < ActiveRecord::Migration[5.2]
  def change
    rename_column :todos, :valid_time, :valid_date
  end
end
