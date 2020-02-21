#全体のコントローラー

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #SessionHelperを読み込む
  include SessionsHelper

  private

  #ログイン済みかを確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインして下さい"
      redirect_to login_url
    end
  end
end
