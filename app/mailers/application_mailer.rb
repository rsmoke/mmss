class ApplicationMailer < ActionMailer::Base
  default bcc: 'MMSS Office <mmss@umich.edu>', from: 'MMSS Admin <mmss-support@umich.edu>'
  layout 'mailer'
end
