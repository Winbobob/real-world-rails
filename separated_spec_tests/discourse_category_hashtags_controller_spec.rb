require 'rails_helper'

describe CategoryHashtagsController do
  describe "check" do
    describe "logged in" do
      before do
        log_in(:user)
      end

      it 'only returns the categories that are valid' 


      it 'does not return restricted categories for a normal user' 


      it 'returns restricted categories for an admin' 

    end

    describe "not logged in" do
      it 'raises an exception' 

    end
  end
end

