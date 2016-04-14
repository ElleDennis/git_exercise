class UsersController < ApplicationController
 def index
    @user = User.all
  end

  def new
    @user = User.new
  end

   def create
     @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))

    if @user.save
      redirect_to @user, "Sign up was successful. Please sign in to submit a listing."
    else
      render :new
    end
  end

    def show
      @user = User.find(params[:id])
      @grams = @user.grams.page(params[:page]).per(5)
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy

      redirect_to users_path
    end
end
