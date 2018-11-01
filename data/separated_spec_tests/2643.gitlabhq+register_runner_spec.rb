# frozen_string_literal: true

module QA
  context 'Verify', :docker do
    describe 'Runner registration' do
      let(:executor) { "qa-runner-#{Time.now.to_i}" }

      after do
        Service::Runner.new(executor).remove!
      end

      it 'user registers a new specific runner' 

    end
  end
end

