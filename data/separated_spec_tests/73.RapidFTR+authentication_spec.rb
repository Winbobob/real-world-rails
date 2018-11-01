require 'spec_helper'

module Security
  describe Authentication, :type => :normal do

    class FakeController
      include Authentication

      attr_reader :session, :request

      def initialize
        @session = {}
        @request = OpenStruct.new(:headers => {})
      end
    end

    before :each do
      @controller = FakeController.new
      @session = create :session

      allow(@controller).to receive(:session_expiry_timeout).and_return(5.minutes)
      @controller.session[:rftr_session_id] = @session.id
      @controller.session[:last_access_time] = 1.minute.ago.rfc2822
    end

    it 'should fetch session expiry timeout from configuration' 


    it 'should check successful authentication' 


    it 'should raise ErrorResponse if no session ID' 


    it 'should raise ErrorResponse if no Access Timestamp' 


    it 'should raise ErrorResponse if access time expired' 


    xit 'should raise ErrorResponse if device blacklisted' do
      expect do
        mock_session = Session.new
        mock_session.stub :device_blacklisted? => true
        @controller.stub :current_session => mock_session
        @controller.send :check_authentication
      end.to raise_error(ErrorResponse)
    end

  end
end

