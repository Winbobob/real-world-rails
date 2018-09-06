require 'spec_helper'

describe MailService do
  let(:service)  { MailService               }
  let!(:default) { create(:pq_email)         }
  let!(:sent)    { create(:pq_email_sent)    }
  let!(:failed)  { create(:pq_email_failed)  }  

  it '#mail_to_send - returns email in new/failed states' 


  it '#abandoned_mail - returns mail in abandoned state' 


  it '#new_mail - returns mail in new state' 



  it '#record_attempt - updates db fields for a send attempt' 


  it '#record_success - updates db fields for sent emails' 


  it '#record_fail - updates db fields for failed email delivery' 


  it '#record_abandon - updates db fields for an abandoned email' 


  it '#send_mail - calls the relevant mailer to send a db record' 

end


