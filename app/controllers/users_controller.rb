class UsersController < ApplicationController
 before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
 before_action :correct_user, only:[:edit, :update]
 before_action :admin_user, only: :destroy


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーは削除されました。"
    redirect_to users_url
  end

  def index
    @users = User.paginate(page: params[:page], per_page:7) #ページネート用　コントローラに設定
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    @questions = @user.questions.paginate(page: params[:page])
  end

  def new  #新規作成。ユーザページをサーバからGetする。
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Eメールを確認してアカウントを有効化してください"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params) #strong Parametersでマスアサインメントの脆弱性を防止
      flash[:success] = "基本情報変更完了"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :image, :password_confirmation, :age, :area, :branch)
    end

    #beforeアクション
    #正しいユーザーかを確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    #管理者かを確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
