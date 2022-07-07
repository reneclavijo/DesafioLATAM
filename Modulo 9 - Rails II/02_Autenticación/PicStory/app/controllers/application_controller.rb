class ApplicationController < ActionController::Base

    def necesito_estar_autenticado!
        if session[:user_id]
            @usuario = User.find(session[:user_id])
        else
           redirect_to new_session_path 
        end
    end
end
