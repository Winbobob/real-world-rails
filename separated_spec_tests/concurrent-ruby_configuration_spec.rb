module Concurrent

   RSpec.describe 'configuration', notravis: true do

    before(:all) do
      reset_gem_configuration
    end

    after(:each) do
      reset_gem_configuration
    end

    context 'global executors' do

      it 'creates a global timer set' 


      it 'creates a global fast executor' 


      it 'creates a global io executor' 


      specify 'Concurrent::AtExit.run acts on all executors with auto_terminate: true' do
        # The 'at_least(:once)' clauses account for global config reset
        expect(Concurrent.global_fast_executor).to receive(:kill).at_least(:once).with(no_args).and_call_original
        expect(Concurrent.global_io_executor).to receive(:kill).at_least(:once).with(no_args).and_call_original
        expect(Concurrent.global_timer_set).to receive(:kill).at_least(:once).with(no_args).and_call_original
        Concurrent::AtExit.run
      end
    end
   end
end

