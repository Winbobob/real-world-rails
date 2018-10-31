require 'spec_helper'

describe MailService::Pq do
  let(:service)  { MailService::Pq                    }
  let(:email_to) { 'to@domain.com'                    }
  let(:params)   { { email: email_to, cc: email_to }  }
  let(:ao)       { double ActionOfficer               }
  let(:pq)       { double Pq                          }

  it '#commission_email - should create a commission email db record' 


  it '#notify_dd_email - should create a dd notification email db record' 


  it '#acceptance_email - should create an acceptance email db record' 


  it '#acceptance_reminder_email - should create an acceptance reminder email db record' 


  it '#draft_reminder_email - should create a draft reminder email db record' 


  it '#watchlist_email - should create a watchlist email db record' 

end

