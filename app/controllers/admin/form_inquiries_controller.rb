class Admin::FormInquiriesController < ApplicationController

  def index
    @form_inquiries = FormInquiry.all.order(created_at: "DESC").page(params[:page]).per(10)
  end

  def show
    @form_inquiry = FormInquiry.find(params[:id])
    @user = User.find(@form_inquiry.user_id)
  end

  def update
    @form_inquiry = FormInquiry.find(params[:id])
    @form_inquiry.update(form_inquiry_params)
    redirect_to admin_form_inquiry_path(@form_inquiry), notice: "対応ステータスを更新しました"
  end

  private

  def form_inquiry_params
    params.require(:form_inquiry).permit(:response_status)
  end

end
