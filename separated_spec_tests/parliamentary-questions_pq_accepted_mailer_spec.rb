require 'spec_helper'

describe 'PQAcceptedMailer' do
  let(:contact1)       { create(:minister_contact, email: 'test1@tesk.uk')                     }
  let(:contact2)       { create(:minister_contact, email: 'test2@tesk.uk')                     }
  let(:ao)             { create(:action_officer, name: 'ao name 1', email: 'ao@ao.gov')        }
  let(:minister_1)     { create(:minister, name: 'Mr Name1 for Test')                          }
  let(:minister_2)     { create(:minister, name: 'Mr Name2 for Test')                          }
  let(:minister_simon) { create(:minister, name: 'Simon Hughes (MP)')                          }
  let(:dd)             { create(:deputy_director, name: 'Deputy Director', email:'dep@dep.gov')}

  before(:each) do
    ActionMailer::Base.deliveries = []
    minister_1.minister_contacts << contact1
    minister_2.minister_contacts << contact2
  end

  def trigger_acceptance_mail(pq, ao)
    MailService::Pq.acceptance_email(pq, ao)
    MailWorker.new.run!
  end

  describe '#deliver' do
    it 'should set question and the email' 


    it 'should set the right cc with minister ' 


    it 'should cc minister contacts when present' 


    it 'should add the people from the Actionlist to the CC on the draft email link' 


    it 'should contain the name of the minister' 


    it 'should contain the asking minister ' 


    it 'should contain the house ' 


    it 'should contain the right guidance address ' 



    it 'should add the Finance email to the CC list on the draft email link if Finance has registered an interest in the question' 


    it 'should not add the Finance email to the CC list on the draft email link if Finance has not registered an interest in the question' 


    it 'should not add the Finance email to the CC list on the draft email link if Finance has registered an interest in the question but is inactive' 


    it 'should show the date for answer if set' 


    it 'should not show the date for answer block if not set' 


    it 'should add the deputy director of the AO to the CC on the draft email link' 


    it 'should not add the deputy director of the AO to the CC on the draft email link if the ao has no dd ' 

  end
end

