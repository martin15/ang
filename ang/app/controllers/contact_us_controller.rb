class ContactUsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if verify_recaptcha(model: @contact) && @contact.save
    # if @contact.save
      # ContactUsMailer.notification_user(@contact, the_domain).deliver_now
      # ContactUsMailer.notification_officer(@contact, the_domain).deliver_now
      ContactUsMailer.notification_admin(@contact, the_domain).deliver_now
      flash[:notice] = 'Message was successfully sent.'
      redirect_to contact_us_path
    else
      flash[:error] = "Message failed to send"
      render :action => :index
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :company_name,
                                      :subject, :content)
    end
end
