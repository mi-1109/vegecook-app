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
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "public/premiums" && path[:action] == "update"
      render :complete
    else
      render template: 'public/homes/premium'
    end
  end

end
