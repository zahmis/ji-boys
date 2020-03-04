class StaticPagesController < ApplicationController

  def home
    @users = current_user
    @posts = @users.posts.all if logged_in?
    @questions = @users.questions.all if logged_in?
    @posts = @users.posts.paginate(page: params[:page]) if logged_in?
    @questions = @users.questions.paginate(page: params[:page]) if logged_in?
  end
end
