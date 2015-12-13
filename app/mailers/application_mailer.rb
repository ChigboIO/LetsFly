class ApplicationMailer < ActionMailer::Base
  default from: "admin@lets-fly.herokuapp.com"
  layout "mailer"
end
