class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo # Para ActiveStorage y la foto de perfil

  has_many :applications
  has_many :job_postings, through: :applications
  has_many :job_offers

  before_validation :default_values

  def admin?
    admin
  end

  private

  def default_values
    self.admin ||= false
  end
end
