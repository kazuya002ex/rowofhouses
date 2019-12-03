class TodoSerializer < ActiveModel::Serializer
  attributes :id, :body, :done, :valid_time
end
