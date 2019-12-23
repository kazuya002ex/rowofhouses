class StillSerializer < ActiveModel::Serializer
  attributes :id, :body, :done, :valid_date, :deadline, :user_id, :done_time
end
