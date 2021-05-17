class Attendance < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event, optional: true

  after_create :participant_send

  def participant_send
    AttendanceMailer.confirmation_mailer(self).deliver_now
  end
end
