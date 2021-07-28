class ApplicationController < ActionController::API
    include ActionController::Cookies

    def encode_token(payload)
      JWT.encode(payload, 'PYMhtXzsVp6Qat3TrtG3gMnGnjL6KGksJqabzBGUTp7wXqEH3XrC4KDMMuAn9eVhVzz5DwhKdsD9DpLvs6UFrrN3SL8WuqBxaR3PC7ug6MLUUHSRzmUJScegnFNzMKgA69YGBbThVBzhgvT6ayfcJnZsQvLcAESKLwZR7sBLG6tgeahR4yTPDwqZMzYCXFu95SppcDDA2jVuzEAXSRcZR4xAcahgnSYKS2MfUN6vX7B7NgQD8mmAtKbnA8wnEgWr')
    end
  
  
    def auth_header
      # { Authorization: 'Bearer <token>' }
      request.headers['authorization']
    end
  
    def decoded_token
      if auth_header
        token = auth_header
        begin
          JWT.decode(token, 'PYMhtXzsVp6Qat3TrtG3gMnGnjL6KGksJqabzBGUTp7wXqEH3XrC4KDMMuAn9eVhVzz5DwhKdsD9DpLvs6UFrrN3SL8WuqBxaR3PC7ug6MLUUHSRzmUJScegnFNzMKgA69YGBbThVBzhgvT6ayfcJnZsQvLcAESKLwZR7sBLG6tgeahR4yTPDwqZMzYCXFu95SppcDDA2jVuzEAXSRcZR4xAcahgnSYKS2MfUN6vX7B7NgQD8mmAtKbnA8wnEgWr', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
  
    def current_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
  
    def logged_in?
      !!current_user
    end
  
    def authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
  
end
