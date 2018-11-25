class ContactUsMailer < ApplicationMailer
  default from: 'ANG IT Solution<do-not-reply@ang-itsolution.co.id>'

  def notification_user(contact, domain)
    @contact = contact
    @domain = domain
    mail(:to => contact.email, :subject => contact.subject)
  end

  def notification_officer(contact, domain)
    @contact = contact
    @domain = domain
    mail(:to => "anekaniagaglobal10@gmail.com", :subject => "[Officer-ANG] #{contact.subject}")
  end

  def notification_admin(contact, domain)
    @contact = contact
    @domain = domain
    mail(:to => "martin.me15@yahoo.com", :subject => "[Admin-ANG] #{contact.subject}")
  end
end
