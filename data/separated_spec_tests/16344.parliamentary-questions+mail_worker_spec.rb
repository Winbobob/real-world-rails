require 'spec_helper' 

describe MailWorker do
  let(:worker)   { MailWorker.new            }
  let(:file)     { double File               }
  let(:pid_path) { MailWorker::PID_FILEPATH  }
  let!(:default) { create(:pq_email)         }
  let!(:sent)    { create(:pq_email_sent)    }
  let!(:failed)  { create(:pq_email_failed)  } 

  context '#run!' do
    it 'should send all eligible emails in the db' 


    it 'should update the emails in the db as sent if there are no errors' 


    it 'should update the emails in the db as failed if there are errors' 


    it 'should set the state of an email to abandoned if it fails to send repeatedly' 

  end

  context 'PID file' do
    it 'should write a pid file on start' 


    it 'should not process emails and exit if another pid file is present' 


    it 'should clear the pid file on exit' 


    it 'should clear the pid file even if an error occurs' 

  end
end

