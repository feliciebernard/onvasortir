class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  has_many :attendances
  has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"

  after_create :welcome_send

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
