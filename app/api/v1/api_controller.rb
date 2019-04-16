module Api::V1
    class ApiController < ApplicationController
     
  
  
      private
        def require_authentication!
          throw(:warden, scope: :user) unless current_user.presence
        end
    end
  end
  