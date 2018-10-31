require 'spec_helper'

describe AdminEmailWorker do
  subject(:worker) { described_class.new }

  describe '.perform' do
    it 'does not attempt to send repository check mail when they are disabled' 


    context 'repository_checks enabled' do
      before do
        stub_application_setting(repository_checks_enabled: true)
      end

      it 'checks if repository check mail should be sent' 


      it 'does not send mail when there are no failed repos' 


      it 'send mail when there is a failed repo' 

    end
  end
end

