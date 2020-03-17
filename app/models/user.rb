class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:phone_caller, :admin_district, :medical_district, :official_district, :admin_state, :medical_state, :official_state]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :phone_caller
  end

  has_many :calls
  has_many :called, through: :calls
end
