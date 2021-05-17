class AttendanceMailer < ApplicationMailer
  default from: 'onvasortir@yopmail.com'

  def confirmation_mailer(attendance)
    @user = attendance.user 
    @url  = 'https://on-va-sortir.herokuapp.com//event' 
    #@event = attendance.event

    mail(to: @user.try(:email), subject: 'Un nouveau participant participe à ton événement !') 
  end
end