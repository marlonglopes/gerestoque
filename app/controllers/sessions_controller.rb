class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Voce esta logado."
      redirect_to_target_or_default(root_path)
    else
      flash.now[:error] = "Username/Email inválido ou senha inválida."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Você nao está mais logado."
    redirect_to root_path
  end
end
