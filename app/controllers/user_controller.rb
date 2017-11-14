class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @email = params[:email]
    @password = params[:password]
    
    User.create(
      email: @email,
      password: @password
    )
    
    redirect_to '/'
  end

  def show
  end

  def login
  end

  def login_process
    @user = User.find_by(email: params[:email])
    if @user
      if @user.password == params[:password]
        flash[:notice] = "로그인 됬어요"
        session[:user_id] = @user.id
        redirect_to '/'
      else
        flash[:alert] = "패스워드가 틀렸어요"
        redirect_to '/user/login'
      end
    else
      flash[:alert] = "그런 이메일의 유저가 없어"
      redirect_to '/user/new'
    end
  end
  
  
  def logout
    session.clear
    flash[:notice]="로그아웃되었습니다."
    redirect_to '/'
  end
  
  def note
  
  end

end
