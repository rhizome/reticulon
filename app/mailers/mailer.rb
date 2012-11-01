class Mailer < ActionMailer::Base

  def invitation(invitation)
  	@token = invitation.confirmation_token
    mail(:to => "#{invitation.email}", :subject => "Reminder for Reticulon!", :from => 'notifications@CHANGEME.invalid')
  end
end
