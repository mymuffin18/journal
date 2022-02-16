
module Api
    module V1

        class MembersController < ApplicationController
            before_action :authenticate_user!
        
            def index
                 user = get_user_from_token
                 render json: user, status: :ok
            end
        
        
        
            private
            def get_user_from_token
                jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                                Rails.application.secret_key_base).first
                user_id = jwt_payload['sub']
                User.find(user_id.to_s)
            end
        end
    end
end
