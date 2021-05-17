class UserMailer < ApplicationMailer
  default from: 'onvasortir@yopmail.com'

  def welcome_email(user)
    @user = user 

    @url  = 'https://git.heroku.com/on-va-sortir.git/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue dans la communauté des gens qui sortent !') 
  end
end