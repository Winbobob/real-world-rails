require 'feature_helper'

describe HealthCheck::MailWorker do
  let(:pid_path)    { Settings.mail_worker.pid_filepath                       }
  let(:worker)      { HealthCheck::MailWorker.new                             }
  let(:mail)        { double Email, status: 'abandoned'                       }
  let(:stale_mail)  { double Email, status: 'new', created_at: Date.yesterday }

  context '#available?' do
    it 'returns true if the mail worker is available' 


    it 'returns false if the mail worker is not available' 


    it 'should return false if stale new emails are present' 

  end

  context '#accessible?' do
    it 'returns true if the mail service is accessible and no emails are abandoned' 


    it 'returns false if the mail service is not accessible' 


    it 'returns false if there are abandoned emails' 

  end

  context '#error_messages' do
    it 'returns the exception messages if the pid file is stale' 


    it 'returns the exception messages if emails have been abandoned' 


    it 'returns an error an backtrace for errors not specific to a component' 

  end
end

