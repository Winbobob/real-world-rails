# EDSC-247: Allow retrying collection and granule searches after timeout errors

require "spec_helper"

describe "Displaying system errors", reset: false do
  context 'when a system error occurs' do
    before :all do
      load_page :search
      fill_in 'keywords', with: 'trigger500'
      wait_for_xhr
    end

    it "displays an error message containing the type of request that caused the error" 


    it "displays the readable message from the server, if available" 


    it "displays a link to retry requests" 


    context 'and the user performs a subsequent successful request' do
      before :all do
        fill_in 'keywords', with: ' '
        wait_for_xhr
      end

      after :all do
        fill_in 'keywords', with: 'trigger500'
      end

      it 'removes the error message' 

    end
  end

  context 'when invalid parameters are entered' do
    before :all do
      load_page :search, focus: 'C1000000029-EDF_OPS', env: :sit, queries: [{ id: '*foo!*foo2!*foo3' }], close_banner: false
    end

    it 'displays an error message containing the type of request that caused the error' 


    it 'displays the readable message from the server, if available' 

  end
end

