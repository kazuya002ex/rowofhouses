namespace :todo do

  desc "有効日時を過ぎたTodoを削除します"
  task delete: :environment do
    expired_todos = Todo.where(valid_date: Time.zone.today)
    pp expired_todos
    expired_todos.each do |todo|
      todo.destroy
    end
    pp expired_todos
  end
end