class UsersController < ApplicationController
  
  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/:id
  def show
    
  end
  
  # POST /users
  def create
      @user = User.new(user_params)
      if @user.save
        # agregar a la cookie que tiene la variable de sesión
        session[:user_id] = @user.id
        # regresar al root_path
        redirect_to root_path
      else
        render :new
      end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
