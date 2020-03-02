class StaticPagesController < ApplicationController

  def home
    @post = current_user.posts.build if logged_in?
    @user = current_user
    @posts = @user.posts.paginate(page: params[:page]) if logged_in?
  end

  def article
    @post = current_user.posts.build if logged_in?
  end

  def all_article
    @posts = Post.all.order(created_at: 'desc')
    @posts = Post.paginate(page: params[:page],per_page:10)
  end
end
