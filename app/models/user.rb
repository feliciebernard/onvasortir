class User < ApplicationRecord
  has_many :events
  has_many :attendances

  after_create :welcome_send

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
