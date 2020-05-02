class StaticPagesController < ApplicationController

  def home
    @user =current_user
    @posts = @user.posts.all if logged_in?
    @questions = @user.questions.all if logged_in?
    @posts = @user.posts.paginate(page: params[:page]) if logged_in?
    @questions = @user.questions.paginate(page: params[:page]) if logged_in?

    #天気
    uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    @today_tel = result['forecasts'][0]['telop']
    @min_tem = result['forecasts'][1]['temperature']['min']['celsius']
    @max_tem = result['forecasts'][1]['temperature']['max']['celsius']


    uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?q=Tokyo&units=metric&appid=#{ENV['OPEN_WEATHER_API_KEY']}")
    json = Net::HTTP.get(uri)
    res = JSON.parse(json)
    @current_tem = res['main']['temp']
    @wind = res['wind']['speed']
    @humidity = res['main']['humidity']
    @clouds = res['clouds']['all']
    @icon = res['weather'][0]['icon']

    @wind_point = -0.091*@wind*@wind + 25
    #@temp = 1/Math.sqrt(2*3.14)*10
    #@temp2 = Math.exp(-(@humidity-50)**2/2*10*10)こいつがゼロになる
    #@temp3 = @temp*@temp2
     @humidity_point1 = -(@humidity-50)**2*0.031
     @humidity_point2 = @humidity_point1 + 25
     @kion_point = -0.12*(@current_tem-20)**2+25

    if @today_tel == "晴れ"
      @temp_point = 25
    elsif @today_tel == "曇り"
      @temp_point = 20
    elsif @today_tel == "雨"
      @temp_point = 0
    end
  end


  def new_guest
    @user = User.find(5)
    log_in @user
    flash[:success]= "お試しログイン完了！"
    redirect_to @user
  end
end
