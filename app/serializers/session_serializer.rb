class SessionSerializer < ActiveModel::Serializer
  attributes :id, :name, :password
end
