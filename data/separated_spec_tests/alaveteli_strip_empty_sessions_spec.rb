# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
describe StripEmptySessions do

  def make_response(session_data, response_headers)
    app = lambda do |env|
      env['rack.session'] = session_data
      return [200, response_headers, ['content']]
    end
    strip_empty_sessions = StripEmptySessions
    app = strip_empty_sessions.new(app, {:key => 'mykey', :path => '', :httponly => true})
    response = Rack::MockRequest.new(app).get('/', 'HTTP_ACCEPT' => 'text/html')
  end


  it 'should not prevent a cookie being set if there is data in the session' 


  describe 'if there is no meaningful data in the session' do

    before do
      @session_data = { 'session_id' => 'my_session_id',
                        '_csrf_token' => 'hi_there' }
    end

    it 'should not strip any other header' 


    it 'should strip the session cookie setting header ' 


    it 'should strip the session cookie setting header even with a locale' 


    it 'should not strip the session cookie setting for admins' 


    it 'should strip the session cookie setting header (but no other cookie setting header) if there is more than one' 


  end
end

