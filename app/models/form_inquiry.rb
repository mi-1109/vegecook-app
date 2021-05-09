class FormInquiry < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user
  enum response_status: { outstanding: 0, in_progress: 1, closed: 2}
end
