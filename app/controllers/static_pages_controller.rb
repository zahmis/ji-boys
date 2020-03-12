class StaticPagesController < ApplicationController

  def home
    @user =current_user
    @users = current_user
    @posts = Post.all.includes(:users).order(created_at: 'desc')
    @questions = Question.all.order(created_at: 'desc')
    @posts = Post.paginate(page: params[:page])
    @questions = Question.paginate(page: params[:page])
  end
end
