# frozen_string_literal: true

module QA
  context 'Verify', :orchestrated, :docker do
    describe 'Pipeline creation and processing' do
      let(:executor) { "qa-runner-#{Time.now.to_i}" }

      after do
        Service::Runner.new(executor).remove!
      end

      it 'users creates a pipeline which gets processed' 

    end
  end
end

