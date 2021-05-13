class Admin::FormInquiriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @form_inquiries = FormInquiry.all.order(created_at: "DESC").page(params[:page]).per(10)
  end

  def show
    @form_inquiry = FormInquiry.find(params[:id])
    @user = User.find(@form_inquiry.user_id)
  end

  def update
    @form_inquiry = FormInquiry.find(params[:id])
    if @form_inquiry.update(form_inquiry_params)
      redirect_to admin_form_inquiry_path(@form_inquiry), notice: "対応ステータスを更新しました"
    else
      render :show, alert: "対応ステータスを更新できませんでした"
    end
  end

  private

  def form_inquiry_params
    params.require(:form_inquiry).permit(:response_status)
  end

end
