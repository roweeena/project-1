class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
     #create
    if @user.save # returns true on success
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    if params[:image].present?
      req = Cloudinary::Uploader.upload(params[:image])
      user.image = req["public_id"]
    end
    user.update user_params
    redirect_to user
  end

  def show
    @user = User.find params[:id]
    # @items = Item.all.where(user_id: @current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :location, :dob, :username, :image, :email, :password, :password_confirmation)
  end
end
