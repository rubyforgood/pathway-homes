class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :show]
  skip_before_filter :check_for_expired_password, only: [:show, :edit, :update]

  def index
    authorize! :manage, User
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    authorize! :update, @user
  end

  def create
    authorize! :create, User

    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:notice] = "Request ##{@user.id} was created!"
        format.html { redirect_to users_path }
      else
        flash[:alert] = @user.errors.full_messages.join('. ')
        format.html { render action: "new" }
      end
    end
  end

  def update
    authorize! :update, @user

    respond_to do |format|
      if @user.update!(user_params)
        format.html {
          if @user == current_user
            sign_in @user, bypass: true
            redirect_to root_url, notice: 'Your profile was successfully updated.'
          else
            redirect_to users_url, notice: 'User was successfully updated.'
          end
        }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    authorize! :destroy, @user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id] == 'current'
        @user = current_user
      else
        @user = User.find(params[:id])
      end
    end

    def user_params
      allowed_params = [:email, :name, :password]
      allowed_params << :role if can? :manage, User

      user_params = params.require(:user).permit(*allowed_params)
      user_params.delete(:password) if user_params[:password].blank?
      user_params
    end
end

