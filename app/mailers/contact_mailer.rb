class ContactMailer < ActionMailer::Base
  default from: "igor.batista@gmail.com"

  def contact_message(contact)
    @contact = contact
    mail(to: "igorcbatista@hotmail.com", subject: "Quero Comprar")
  end
end
