ActionMailer::Base.smtp_settings = {
  :address              => "localhost",
  :port                 => 25,
  :domain               => "domain.CHANGEME",
  :authentication       => "plain",
}
