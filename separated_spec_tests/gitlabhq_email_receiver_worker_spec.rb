require "spec_helper"

describe EmailReceiverWorker, :mailer do
  let(:raw_message) { fixture_file('emails/valid_reply.eml') }

  context "when reply by email is enabled" do
    before do
      allow(Gitlab::IncomingEmail).to receive(:enabled?).and_return(true)
    end

    it "calls the email receiver" 


    context "when an error occurs" do
      before do
        allow_any_instance_of(Gitlab::Email::Receiver).to receive(:execute).and_raise(error)
      end

      context 'when the error is Gitlab::Email::EmptyEmailError' do
        let(:error) { Gitlab::Email::EmptyEmailError }

        it 'sends out a rejection email' 

      end

      context 'when the error is Gitlab::Email::AutoGeneratedEmailError' do
        let(:error) { Gitlab::Email::AutoGeneratedEmailError }

        it 'does not send out any rejection email' 

      end
    end
  end

  context "when reply by email is disabled" do
    before do
      allow(Gitlab::IncomingEmail).to receive(:enabled?).and_return(false)
    end

    it "doesn't call the email receiver" 

  end
end
