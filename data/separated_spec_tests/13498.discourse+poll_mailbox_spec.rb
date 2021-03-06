require 'rails_helper'
require_dependency 'jobs/regular/process_post'

describe Jobs::PollMailbox do

  let(:poller) { Jobs::PollMailbox.new }

  describe ".execute" do

    it "does no polling if pop3_polling_enabled is false" 


    it "polls when pop3_polling_enabled is true" 


  end

  describe ".poll_pop3" do

    context "pop errors" do
      let(:user) { Fabricate(:user) }

      before do
        Discourse.expects(:handle_job_exception).at_least_once
      end

      after do
        $redis.del(Jobs::PollMailbox::POLL_MAILBOX_TIMEOUT_ERROR_KEY)
      end

      it "add an admin dashboard message on pop authentication error" 


      it "logs an error on pop connection timeout error" 

    end

    it "calls enable_ssl when the setting is enabled" 


    it "does not call enable_ssl when the setting is disabled" 


    context "has emails" do
      before do
        mail1 = Net::POPMail.new(3, nil, nil, nil)
        mail2 = Net::POPMail.new(3, nil, nil, nil)
        mail3 = Net::POPMail.new(3, nil, nil, nil)
        Net::POP3.any_instance.stubs(:start).yields(Net::POP3.new(nil, nil))
        Net::POP3.any_instance.stubs(:mails).returns([mail1, mail2, mail3])
        Net::POP3.any_instance.expects(:delete_all).never
        poller.stubs(:process_popmail)
      end

      it "deletes emails from server when when deleting emails from server is enabled" 


      it "does not delete emails server inbox when deleting emails from server is disabled" 

    end
  end

  describe "#process_popmail" do
    def process_popmail(email_name)
      pop_mail = stub("pop mail")
      pop_mail.expects(:pop).returns(email(email_name))
      Jobs::PollMailbox.new.process_popmail(pop_mail)
    end

    it "does not reply to a bounced email" 


  end

end

