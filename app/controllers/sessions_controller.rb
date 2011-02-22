class SessionsController < ApplicationController

	before_filter :check_remote_ip

  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Você esta logado."
      redirect_to_target_or_default(root_path)
    else
      flash.now[:error] = "Usuário/Email inválido ou senha inválida."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Você não está mais logado."
    redirect_to root_path
  end
  
  
  private

  def check_remote_ip
		redirect_to root_path unless remote_addr
  end
end
