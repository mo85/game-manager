class AdminController < ApplicationController
  
  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        flash[:notice] = "Du wurdest erfolgreich angemeldet."
        redirect_to(:controller => "root", :action => "index")
      else
        flash.now[:notice] = "Falsche Benutzer/Passwort Kombination."
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Du hast dich erfolgreich abgemeldet."
    redirect_to(:controller => 'root')
  end
end