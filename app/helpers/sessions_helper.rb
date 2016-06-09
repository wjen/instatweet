module SessionsHelper

  #Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end


  #Returns the current logged-in user (if any)
  def current_user
      @current_user ||= User.find_by(id: session[:user_id])
  end

  #Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end


  #Redirects back to stored location (or back to user by default)
  def redirect_back_or(user)
    redirect_to(session[:forwarding_url] || user)
    session.delete(:forwarding_url)
  end

  #Stores the URL trying to get to.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end


  def current_user?(user)
    user == current_user
  end


  #logs out user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end





end
