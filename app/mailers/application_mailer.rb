class ApplicationMailer < ActionMailer::Base
  default bcc: 'MMSS Office <mmss@umich.edu>', from: 'MMSS Admin <mmss-support@umich.edu>'
  layout 'mailer'

  @url = "https://lsa-math-mmss.miserver.it.umich.edu"
end
