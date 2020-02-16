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
    @users = User.paginate(page: params[:page]) #usersテーブルから全てを＠usersに渡しなさい
  end

  def show
    @user = User.find(params[:id]) #usersテーブルから入力されたidを検索し＠userに渡しなさい
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) #strong Parametersでマスアサインメントの脆弱性を防止    脆弱なコード @user = User.new(params[:user])
    if @user.save
      log_in @user
      flash[:success] = "ようこそ！"
      redirect_to @user
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
      flash[:success] = "プロフィール変更完了"
      redirect_to @user
    else
      render 'edit'
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    #beforeアクション

    #ログイン済みかを確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインして下さい"
        redirect_to login_url
      end
    end

    #正しいユーザーかどうかを確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
