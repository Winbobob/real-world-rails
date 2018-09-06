# frozen_string_literal: true

Capybara::SpecHelper.spec '#reset_session!' do
  it "removes cookies" 


  it "resets current url, host, path" 


  it "resets page body" 


  it "is synchronous" 


  it "handles modals during unload", requires: [:modals] do
    @session.visit('/with_unload_alert')
    expect(@session).to have_selector(:css, 'div')
    expect { @session.reset_session! }.not_to raise_error
    expect(@session).to have_no_selector :xpath, "/html/body/*", wait: false
  end

  it "handles already open modals", requires: [:modals] do
    @session.visit('/with_unload_alert')
    @session.click_link('Go away')
    expect { @session.reset_session! }.not_to raise_error
    expect(@session).to have_no_selector :xpath, "/html/body/*", wait: false
  end

  it "raises any standard errors caught inside the server", requires: [:server] do
    quietly { @session.visit("/error") }
    expect do
      @session.reset_session!
    end.to raise_error(TestApp::TestAppError)
    @session.visit("/")
    expect(@session.current_path).to eq("/")
  end

  it "closes extra windows", requires: [:windows] do
    @session.visit('/with_html')
    @session.open_new_window
    @session.open_new_window
    expect(@session.windows.size).to eq 3
    @session.reset_session!
    expect(@session.windows.size).to eq 1
  end

  it "closes extra windows when not on the first window", requires: [:windows] do
    @session.visit('/with_html')
    @session.switch_to_window(@session.open_new_window)
    @session.open_new_window
    expect(@session.windows.size).to eq 3
    @session.reset_session!
    expect(@session.windows.size).to eq 1
  end

  context "When reuse_server == false" do
    before do
      @reuse_server = Capybara.reuse_server
      Capybara.reuse_server = false
    end

    it "raises any standard errors caught inside the server during a second session", requires: [:server] do
      Capybara.using_driver(@session.mode) do
        Capybara.using_session(:another_session) do
          @another_session = Capybara.current_session
          quietly { @another_session.visit("/error") }
          expect do
            @another_session.reset_session!
          end.to raise_error(TestApp::TestAppError)
          @another_session.visit("/")
          expect(@another_session.current_path).to eq("/")
        end
      end
    end

    after do
      Capybara.reuse_server = @reuse_server
    end
  end

  it "raises configured errors caught inside the server", requires: [:server] do
    prev_errors = Capybara.server_errors.dup

    Capybara.server_errors = [LoadError]
    quietly { @session.visit("/error") }
    expect do
      @session.reset_session!
    end.not_to raise_error

    quietly { @session.visit("/load_error") }
    expect do
      @session.reset_session!
    end.to raise_error(LoadError)

    Capybara.server_errors = prev_errors
  end

  it "ignores server errors when `Capybara.raise_server_errors = false`", requires: [:server] do
    Capybara.raise_server_errors = false
    quietly { @session.visit("/error") }
    @session.reset_session!
    @session.visit("/")
    expect(@session.current_path).to eq("/")
  end
end

