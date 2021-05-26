# frozen_string_literal: true

class Admin::Devise::SessionsController < Devise::SessionsController
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

  # ======= ゲストログイン機能 =========
  def guest_sign_in
    admin = Admin.guest
    sign_in admin
    redirect_to admin_root_path, notice: 'ゲスト・アカウント（管理者）でログインしました。'
  end
end
