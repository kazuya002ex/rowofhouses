namespace :todo do

  desc "有効日時を過ぎたTodoを削除します"
  task delete: :environment do
    expired_todos = []
    today_todos = Todo.where(valid_date: Time.zone.today)
    today_todos.map do |todo|
      if todo.deadline.to_s(:time) < Time.zone.now.to_s(:time)
        expired_todos << todo
      else
        next
      end
    end
    puts "#{expired_todos.count}件のタスクを削除しました。"
    expired_todos.each { |todo| todo.destroy }
  end
end