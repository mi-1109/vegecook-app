class Public::PremiumsController < ApplicationController

  def payment
    if user_signed_in?
      render :payment
    else
      redirect_to new_user_registration_path, alert: "無料会員登録の上、プレミアム・プラン加入手続きにお進みください。会員の方は、ログインをお願いいたします。"
    end
  end

  def update
    @user = current_user
    if @user.is_paid == false
      @user.update(is_paid: true)
      redirect_to premiums_complete_path
    else
      flash[:error] = "お客様はすでにプレミアム・プランに加入されています。"
      render :payment
    end
  end

  def complete
    if request.referer&.include?("/premiums")
      render :complete
    else
      redirect_to premium_path
    end
  end

end
