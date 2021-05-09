class Public::PremiumsController < ApplicationController
  before_action :authenticate_user!

  def payment
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
