class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def new_participant(recipient)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @administrator = recipient.event.administrator
    
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://evenbritecharlotte.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @administrator.email, subject: 'Nouvelle inscription pour votre évènement !') 
  end
end
