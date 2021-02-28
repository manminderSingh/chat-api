class AuthenticationSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at, :username
end
