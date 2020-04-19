class StaticPagesController < ApplicationController

  def home
    @user =current_user
    @posts = @user.posts.all if logged_in?
    @questions = @user.questions.all if logged_in?
    @posts = @user.posts.paginate(page: params[:page]) if logged_in?
    @questions = @user.questions.paginate(page: params[:page]) if logged_in?
  end

  def new_guest
    @user = User.find(5)
    log_in @user
    flash[:success]= "お試しログイン完了！"
    redirect_to @user
  end
end
