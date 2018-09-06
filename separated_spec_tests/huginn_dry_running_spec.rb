require 'rails_helper'

describe "Dry running an Agent", js: true do
  let(:agent)   { agents(:bob_website_agent) }
  let(:formatting_agent) { agents(:bob_formatting_agent) }
  let(:user)    { users(:bob) }
  let(:emitter) { agents(:bob_weather_agent) }

  before(:each) do
    login_as(user)
  end

  def open_dry_run_modal(agent)
    visit edit_agent_path(agent)
    click_on("Dry Run")
    expect(page).to have_text('Event to send')
  end

  context 'successful dry runs' do
    before do
      stub_request(:get, "http://xkcd.com/").
        with(:headers => {'Accept-Encoding'=>'gzip,deflate', 'User-Agent'=>'Huginn - https://github.com/huginn/huginn'}).
        to_return(:status => 200, :body => File.read(Rails.root.join("spec/data_fixtures/xkcd.html")), :headers => {})
    end

    it 'opens the dry run modal even when clicking on the refresh icon' 


    it 'shows the dry run pop up without previous events and selects the events tab when a event was created' 


    it 'shows the dry run pop up with previous events and allows use previously received event' 


    it 'sends escape characters correctly to the backend' 

  end

  it 'shows the dry run pop up without previous events and selects the log tab when no event was created' 

end

