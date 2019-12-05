class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :password_confirmation
end
