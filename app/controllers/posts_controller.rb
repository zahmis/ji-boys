class PostsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @posts = Post.all.order(created_at: 'desc')
    @posts = Post.paginate(page: params[:page], per_page: 10)

  end

  def new
    @post = Post.new
  end

  def show
    @posts = Post.find(params[:id])
    @user = @posts.user
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿完了"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿は削除されました"
    redirect_to request.referrer || root_url  #一つ前のURLを返すもしくはルートURLを返す
  end

  private

    def post_params
      params.require(:post).permit(:content, :image, :title)
    end

    def correct_user
      @post = current_user.posts.find_by(id:params[:id])
      redirect_to root_url if @post.nil?
    end
end
