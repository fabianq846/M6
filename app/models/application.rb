class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job_posting

  belongs_to :job_offer
  # app/models/application.rb
  validates :message, presence: true

end
