module Api
    module V1
        class RegistrationsController < Devise::RegistrationsController
            respond_to :json

            def create
                super { |resource| @resource = resource }
            end
        end
    end
end
