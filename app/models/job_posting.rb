class JobPosting < ApplicationRecord
    has_many :applications
    has_many :applicants, through: :applications, source: :user
end
