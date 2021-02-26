module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user
    
    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      # unless request.headers.key?('Authorization') && request.headers['Authorization'].split(' ').size > 1
      #   reject_unauthorized_connection
      # end

      # token = request.headers['Authorization'].split(' ')[1]
      # jwt = JWT.decode(token, Rails.application.credentials.jwt_key, true, algorithm: 'HS256', verify_jti: true)[0]

      # if (user == User.find(jwt['id']))
      #   puts user
      #   user
      # else
      #   reject_unauthorized_connection
      # end
    end
  end
end
