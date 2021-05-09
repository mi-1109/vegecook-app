class Admin::FormInquiriesController < ApplicationController

  def index
    @form_inquiries = FormInquiry.all.order(created_at: "DESC").page(params[:page]).per(10)
  end

  def show
    @form_inquiry = FormInquiry.find(params[:id])
    @user = User.find(@form_inquiry.user_id)
  end
end
