class ConfirmationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation_mailer.user_created.subject
  #
  def user_created
    @greeting = "Hi"
    @user = params[:user]

    mail(
      from: "support.figaro@pentalog.com",
      to: email_address_with_name(@user.email, @user.first_name),
      bcc: "atapuc@pentalog.com",
      subject: "Welcome to Figaro!")
  end
end
