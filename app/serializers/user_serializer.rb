class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :created_at, :username

  attribute :created_date do |user|
    user && user.created_at.strftime('%d/%m/%Y')
  end
end
