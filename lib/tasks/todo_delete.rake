namespace :todo do

  desc "有効日時を過ぎたTodoを削除します"
  task delete: :environment do
    expired_todos = []
    today_todos = Todo.where(valid_date: Time.zone.today)
    puts "日付だけ"
    pp today_todos
    today_todos.map do |todo|
      if todo.deadline.to_s(:time) < Time.zone.now.to_s(:time)
        expired_todos << todo
      else
        next
      end
    end
    
    puts "配列￥"
    pp expired_todos
    # expired_todos.each { |todo| todo.destroy }
  end
end