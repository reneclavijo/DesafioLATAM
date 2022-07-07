module ApplicationHelper
    
    # obtener el usuario actual
    def current_user
        User.find(session[:user_id])
    end
    
    # preguntar si hemos inicado sesión
    def logged?
        session[:user_id] ? true : false
        # if session[:user_id]
        #     true
        # else
        #     false
        # end
    end    
end
