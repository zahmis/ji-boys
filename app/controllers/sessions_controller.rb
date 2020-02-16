class SessionsController < ApplicationController
  def new

  end

  def create
    #コンソール画面でfind_byするイメージ。create　はログイン機能は、
    #ログインする、ログイン中のユーザーを返す。ユーザーがログインしているのか否か。
    user = User.find_by(email: params[:session][:email].downcase)
    #ユーザーがデータベースにありかつ、認証に成功した場合にのみ
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1'? remember(user): forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Emailとパスワードの組み合わせが間違っています'
      render 'new'
    end
  end

  def destroy
    #destroy はログアウト機能だけ
    log_out if logged_in?
    redirect_to root_url
  end
end
