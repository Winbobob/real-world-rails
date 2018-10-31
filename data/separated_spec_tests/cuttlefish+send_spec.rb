# frozen_string_literal: true

require "spec_helper"

describe EmailServices::Send do
  let(:email) do
    create(
      :email,
      to: "foo@bar.com",
      data: "from: contact@foo.com\nto: foo@bar.com\n\nMy original data"
    )
  end
  let(:send) { EmailServices::Send.call(email: email) }

  it "should open an smtp connection to postfix port 25" 


  it "should send an email with a return-path" 


  it "should send an email to foo@bar.com" 


  it "should use data to figure out what to send" 


  it "should set the postfix queue id on the deliveries based on " \
     "the response from the server" do
    response = double(message: "250 2.0.0 Ok: queued as A123")
    smtp = double(send_message: response)
    allow(Net::SMTP).to receive(:start).and_yield(smtp)

    send

    email.deliveries.each { |d| expect(d.postfix_queue_id).to eq "A123" }
  end

  it "should ignore response from server that doesn't include a queue id" 


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


    it "should record that the deliveries are being open tracked" 


    context "app has disabled open tracking" do
      before(:each) do
        email.app.update_attributes(open_tracking_enabled: false)
      end

      it "should record that the deliveries are not being open tracked" 

    end
  end
end

