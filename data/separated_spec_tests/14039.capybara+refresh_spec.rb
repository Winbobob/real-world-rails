# frozen_string_literal: true

# Note: This file uses `sleep` to sync up parts of the tests. This is only implemented like this
# because of the methods being tested. In tests using Capybara this type of behavior should be implemented
# using Capybara provided assertions with builtin waiting behavior.

Capybara::SpecHelper.spec '#refresh' do
  it 'reload the page' 


  it 'raises any errors caught inside the server', requires: [:server] do
    quietly { @session.visit('/error') }
    expect do
      @session.refresh
    end.to raise_error(TestApp::TestAppError)
  end

  it 'it reposts' 

end

