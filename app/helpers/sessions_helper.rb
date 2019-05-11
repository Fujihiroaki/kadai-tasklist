module SessionsHelper
  # SessionsHelperの内容は無条件で全てのViewから呼び出せる
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end
