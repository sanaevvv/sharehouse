class ApplicationController < ActionController::Base
     before_action :configure_permitted_paramaters, if: :devise_controller?

     def after_sign_up_path_for(resource)
          rooms_path
     end

     def after_sign_in_path_for(resource)
          rooms_path
     end

protected
     def configure_permitted_paramaters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
     end
end
