class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_one_attached :avatar

  enum role: { member: 0, admin: 1 }

  after_initialize do
    self.role ||= :member if new_record?
  end

  validates :username, :email, presence: true, uniqueness: true
  validates :name, presence: true
end
