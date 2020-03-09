class StaticPagesController < ApplicationController

  def home
    @user = current_user
    @posts = @user.posts.all if logged_in?
    @questions = @user.questions.all if logged_in?
    @posts = @user.posts.paginate(page: params[:page]) if logged_in?
    @questions = @user.questions.paginate(page: params[:page]) if logged_in?
  end
end
