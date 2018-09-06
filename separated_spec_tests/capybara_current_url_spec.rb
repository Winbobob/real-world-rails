# frozen_string_literal: true

require "capybara/spec/test_app"

Capybara::SpecHelper.spec '#current_url, #current_path, #current_host' do
  before :all do # rubocop:disable RSpec/BeforeAfterAll
    @servers = Array.new(2) { Capybara::Server.new(TestApp.new).boot }
    # sanity check
    expect(@servers[0].port).not_to eq(@servers[1].port) # rubocop:disable RSpec/ExpectInHook
    expect(@servers.map(&:port)).not_to include 80 # rubocop:disable RSpec/ExpectInHook
  end

  def bases
    @servers.map { |s| "http://#{s.host}:#{s.port}" }
  end

  def should_be_on(server_index, path = "/host", scheme = "http")
    # Check that we are on /host on the given server
    s = @servers[server_index]

    expect(@session).to have_current_path("#{scheme}://#{s.host}:#{s.port}#{path}", url: true)

    expect(@session.current_url.chomp('?')).to eq("#{scheme}://#{s.host}:#{s.port}#{path}")
    expect(@session.current_host).to eq("#{scheme}://#{s.host}") # no port
    expect(@session.current_path).to eq(path)
    # Server should agree with us
    expect(@session).to have_content("Current host is #{scheme}://#{s.host}:#{s.port}") if path == '/host'
  end

  def visit_host_links
    @session.visit("#{bases[0]}/host_links?absolute_host=#{bases[1]}")
  end

  it "is affected by visiting a page directly" 


  it "returns to the app host when visiting a relative url" 


  it "is affected by setting Capybara.app_host" 


  it "is unaffected by following a relative link" 


  it "is affected by following an absolute link" 


  it "is unaffected by posting through a relative form" 


  it "is affected by posting through an absolute form" 


  it "is affected by following a redirect" 


  it "is affected by pushState", requires: [:js] do
    @session.visit("/with_js")
    @session.execute_script("window.history.pushState({}, '', '/pushed')")
    expect(@session.current_path).to eq("/pushed")
  end

  it "is affected by replaceState", requires: [:js] do
    @session.visit("/with_js")
    @session.execute_script("window.history.replaceState({}, '', '/replaced')")
    expect(@session.current_path).to eq("/replaced")
  end

  it "doesn't raise exception on a nil current_url" 


  context "within iframe", requires: [:frames] do
    it "should get the url of the top level browsing context" 

  end
end

