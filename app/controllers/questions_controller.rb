class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :admin_user, only: :destroy

  def index
    @questions = Question.all.order(created_at: 'desc')
     @questions = Question.paginate(page: params[:page], per_page: 10)
  end

  def new
    @question =Question.new
  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "質問完了"
      redirect_to root_url
    else
      render 'static_page/home'
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "質問は削除されました"
    redirect_to request.referrer || root_url
  end

  def edit
    @question = current_user.questions.build(question_params)
  end

  def update
    @question = current_user.questions.build(question_params)
    if @question.update_attributes(user_params)
      flash[:success] = "内容変更"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  private

    def question_params
      params.require(:question).permit(:title, :content, :image)
    end

    def correct_user
      @question = current_user.questions.find_by(id:params[:id])
      redirect_to root_url if @post.nil?
    end

     def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
