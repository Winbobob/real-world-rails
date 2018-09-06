require 'spec_helper'

describe SpamService do
  describe '#when_recaptcha_verified' do
    def check_spam(issue, request, recaptcha_verified)
      described_class.new(issue, request).when_recaptcha_verified(recaptcha_verified) do
        'yielded'
      end
    end

    it 'yields block when recaptcha was already verified' 


    context 'when recaptcha was not verified' do
      let(:project) { create(:project, :public) }
      let(:issue)   { create(:issue, project: project) }
      let(:request) { double(:request, env: {}) }

      context 'when spammable attributes have not changed' do
        before do
          issue.closed_at = Time.zone.now

          allow(AkismetService).to receive(:new).and_return(double(spam?: true))
        end

        it 'returns false' 


        it 'does not create a spam log' 

      end

      context 'when spammable attributes have changed' do
        before do
          issue.description = 'SPAM!'
        end

        context 'when indicated as spam by akismet' do
          before do
            allow(AkismetService).to receive(:new).and_return(double(spam?: true))
          end

          it 'doesnt check as spam when request is missing' 


          it 'checks as spam' 


          it 'creates a spam log' 


          it 'doesnt yield block' 

        end

        context 'when not indicated as spam by akismet' do
          before do
            allow(AkismetService).to receive(:new).and_return(double(spam?: false))
          end

          it 'returns false' 


          it 'does not create a spam log' 

        end
      end
    end
  end
end

