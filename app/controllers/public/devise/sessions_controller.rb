# frozen_string_literal: true

class Public::Devise::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  before_action :reject_user, only: [:create]

  protected

  # ======= 会員ステータスが退会の場合ログインを無効化 =======
  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        redirect_to new_user_session_path
        flash[:error] = "退会済みのアカウントです。お手数ですが、会員登録をお願いいたします。"
      end
    else
      flash[:error] = "入力内容が間違っています。再度お試しください。"
    end
  end

end
