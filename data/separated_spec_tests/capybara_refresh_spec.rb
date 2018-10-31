# frozen_string_literal: true

Capybara::SpecHelper.spec '#refresh' do
  it "reload the page" 


  it "raises any errors caught inside the server", requires: [:server] do
    quietly { @session.visit("/error") }
    expect do
      @session.refresh
    end.to raise_error(TestApp::TestAppError)
  end

  it "it reposts" 

end

