class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # 通常SessionsHelperの中身はViewでしか使えないが、
  # includeを使用することで、モジュール内のメソッドが当該クラスのインスタンスメソッドとして定義される
  # これをMix-inという
  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
