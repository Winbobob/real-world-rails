require 'rails_helper'

describe SupportsController do

  context '#skip' do
    let(:support) { double(:support, id: 4) }
    let(:skip_service) { double(:skip_service).as_null_object }

    before do
      expect(controller).to receive(:current_user).and_return(double(:user))
      expect(controller).to receive(:support).and_return(support).at_least(:once)
      expect(SkipSupport).to receive(:new).with(support).and_return(skip_service)
    end

    it 'executes SkipSupport service' 


    context "when skip isn't successful" do
      it 'redirects to support path with error message' 

    end

    context "when skip is successful" do
      it 'redirects to support path with notice message' 

    end
  end

  context '#destroy' do

    let(:support) { double :support, id: 1, done: false }

    context 'when support was found' do

      before do
        allow(controller).to receive_message_chain(:current_user,
                                                   :received_supports,
                                                   :not_done,
                                                   :find)
                              .and_return(support)
        expect(support).to receive(:destroy).and_return(true)
      end

      it 'destroys support' 


      it 'redirects to root path' 

    end
  end
end


