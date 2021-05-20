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
      redirect_to form_inquiry_complete_path
    else
      render :new
    end
  end

  def complete
    if request.referer&.include?("/form_inquiries")
      render :complete
    else
      redirect_to new_form_inquiry_path
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
