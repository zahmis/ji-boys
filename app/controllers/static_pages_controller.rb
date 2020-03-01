class StaticPagesController < ApplicationController

  def home
    @post = current_user.posts.build if logged_in?
    @user = current_user
    @posts = @user.posts.paginate(page: params[:page]) if logged_in?
  end
end
