class UserIndexSerializer < ActiveModel::Serializer
    attributes :username, :email, :id, :created_at, :updated_at
end
