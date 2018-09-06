# frozen_string_literal: true

Capybara::SpecHelper.spec '#visit' do
  it "should fetch a response from the driver with a relative url" 


  it "should fetch a response from the driver with an absolute url with a port" 


  it "should fetch a response when absolute URI doesn't have a trailing slash" 


  it "should fetch a response when sequentially visiting same destination with a target" 


  it "raises any errors caught inside the server", requires: [:server] do
    quietly { @session.visit("/error") }
    expect do
      @session.visit("/")
    end.to raise_error(TestApp::TestAppError)
  end

  it "should be able to open non-http url", requires: [:about_scheme] do
    @session.visit("about:blank")
    @session.assert_no_selector :xpath, "/html/body/*"
  end

  context "when Capybara.always_include_port is true" do
    let(:root_uri) do
      @session.visit('/')
      URI.parse(@session.current_url)
    end

    before do
      Capybara.always_include_port = true
    end

    after do
      Capybara.always_include_port = false
    end

    it "should fetch a response from the driver with an absolute url without a port" 


    it "should add the server port to a visited url if no port specified", requires: [:server] do
      allow(@session.driver).to receive(:visit)
      @session.visit("http://www.example.com")
      expect(@session.driver).to have_received(:visit).with("http://www.example.com:#{@session.server.port}")
    end

    it "should not override the visit specified port even if default for scheme", requires: [:server] do
      allow(@session.driver).to receive(:visit)
      @session.visit('http://www.example.com:80')
      expect(@session.driver).to have_received(:visit).with("http://www.example.com:80")
    end

    it "should give preference to app_host port if specified", requires: [:server] do
      allow(@session.driver).to receive(:visit)
      Capybara.app_host = "http://www.example.com:6666"
      @session.visit('/random')
      expect(@session.driver).to have_received(:visit).with("http://www.example.com:6666/random")
    end

    it "shouldn't override port if no server", requires: [:server] do
      session = Capybara::Session.new(@session.mode, nil)
      allow(session.driver).to receive(:visit)
      session.visit("http://www.google.com")
      expect(session.driver).to have_received(:visit).with("http://www.google.com")
    end

    it "shouldn't override port if no server but app_host is set", requires: [:server] do
      session = Capybara::Session.new(@session.mode, nil)
      Capybara.app_host = "http://www.example.com:6666"
      allow(session.driver).to receive(:visit)
      session.visit("http://www.google.com")
      expect(session.driver).to have_received(:visit).with("http://www.google.com")
    end
  end

  context "when Capybara.always_include_port is false" do
    before do
      Capybara.always_include_port = false
    end

    it "shouldn't overwrite port if app_host is set", requires: [:server] do
      session = Capybara::Session.new(@session.mode, nil)
      Capybara.app_host = "http://www.example.com:6666"
      allow(session.driver).to receive(:visit)
      session.visit("http://www.google.com")
      expect(session.driver).to have_received(:visit).with("http://www.google.com")
    end

    it "shouldn't overwrite port if port specfified", requires: [:server] do
      session = Capybara::Session.new(@session.mode, nil)
      Capybara.app_host = "http://www.example.com:6666"
      allow(session.driver).to receive(:visit)
      session.visit("http://www.google.com:99")
      expect(session.driver).to have_received(:visit).with("http://www.google.com:99")
    end
  end

  context "without a server", requires: [:server] do
    it "should respect `app_host`" 


    it "should visit a fully qualified URL" 

  end

  context "with Capybara.app_host set" do
    it "should override server", requires: [:server] do
      another_session = Capybara::Session.new(@session.mode, @session.app.dup)
      Capybara.app_host = "http://#{@session.server.host}:#{@session.server.port}"
      another_session.visit('/foo')
      expect(another_session).to have_content("Another World")
      expect(another_session.current_url).to start_with(Capybara.app_host)
      expect(URI.parse(another_session.current_url).port).not_to eq another_session.server.port
      expect(URI.parse(another_session.current_url).port).to eq @session.server.port
    end

    it "should append relative path", requires: [:server] do
      Capybara.app_host = "http://#{@session.server.host}:#{@session.server.port}/redirect/0"
      @session.visit('/times')
      expect(@session).to have_content('redirection complete')
    end

    it "should work if `app_host` has a trailing /", requires: [:server] do
      Capybara.app_host = "http://#{@session.server.host}:#{@session.server.port}/"
      @session.visit('/')
      expect(@session).to have_content('Hello world!')
    end
  end

  it "should send no referer when visiting a page" 


  it "should send no referer when visiting a second page" 


  it "should send a referer when following a link" 


  it "should preserve the original referer URL when following a redirect" 


  it "should send a referer when submitting a form" 


  it "can set cookie if a blank path is specified" 

end

