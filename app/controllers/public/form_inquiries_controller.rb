class Public::FormInquiriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @form_inquiry = FormInquiry.new
  end

  def create
    @form_inquiry = current_user.form_inquiries.new(form_inquiry_params)
    if @form_inquiry.save
      InquiryMailer.send_when_inquiry_received(current_user).deliver
      redirect_to form_inquiry_complete_path
    else
      render :new, alert: "送信できませんでした。お手数ですが入力内容をご確認の上、再度お試しください。"
    end
  end

  def complete
    if request.referer&.include?("/form_inquiries")
      render :complete
    else
      redirect_to new_form_inquiry_path, alert: "不正なアクセスです。入力内容をご確認ください。"
    end
  end

  private

  def form_inquiry_params
    params.require(:form_inquiry).permit(
      :content,
      users_attributes: [:name, :email]
    )
  end
end
