class FormInquiry < ApplicationRecord
  belongs_to :user
  enum response_status: { outstanding: 0, in_progress: 1, closed: 2}
  validates :content, presence: true, length: {maximum: 280}
end
