require "spec_helper"

describe OutgoingDelivery do
  describe "#send" do
    context "an email with one recipient" do
      before :each do
        @email = FactoryGirl.create(:email, to: "foo@bar.com", data: "from: contact@foo.com\nto: foo@bar.com\n\nMy original data")
        @outgoing = OutgoingDelivery.new(@email.deliveries.first)
      end

      it "should open an smtp connection to localhost port 1025" 


      it "should send an email with a return-path" 


      it "should send an email to foo@bar.com" 


      it "should use data to figure out what to send" 


      it "should set the postfix queue id on the deliveries based on the response from the server" 


      context "deliveries is empty" do
        before :each do
          allow_any_instance_of(Delivery).to receive(:send?).and_return(false)
        end

        it "should send no emails" 

      end

      context "don't actually send anything" do
        before :each do
          smtp = double(send_message: double(message: ""))
          allow(Net::SMTP).to receive(:start).and_yield(smtp)
        end

        it "should record to which destinations the email has been sent" 


        it "should record to which destinations the email has been sent" 

      end
    end
  end

  describe ".extract_postfix_queue_id_from_smtp_message" do
    it "should extract the queue id" 


    it "should ignore any other form" 

  end
end

