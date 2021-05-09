class FormInquiry < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user

  enum response_status: { outstanding: 0, in_progress: 1, closed: 2}
  # validates :response_status, inclusion: { in: FormInquiry.response_statuses }

  # def response_status!
  #   if outstanding?
  #     in_progress!
  #   elsif in_progress!
  #     closed!
  #   else closed!
  #     outstanding!
  #   end
  # end

end
