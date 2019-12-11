class TodoSerializer < ActiveModel::Serializer
  attributes :id, :body, :done, :valid_date, :deadline, :user_id
end
