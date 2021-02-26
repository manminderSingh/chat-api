class UserIndexSerializer < ActiveModel::Serializer
  # include JSONAPI::Serializer
    attributes :username, :email, :id, :created_at, :updated_at
end
