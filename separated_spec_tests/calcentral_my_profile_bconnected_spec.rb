describe 'Profile bConnected', :testui => true do

  if ENV['UI_TEST']

    before(:each) do
      @driver = WebDriverUtils.launch_browser
    end

    after(:each) do
      WebDriverUtils.quit_browser(@driver)
    end

    context 'as any user' do

      before(:example) do
        @splash_page = CalCentralPages::SplashPage.new @driver
        @cal_net = CalNetAuthPage.new @driver
        dashboard_page = @splash_page.log_into_dashboard(@driver, @cal_net, UserUtils.qa_username, UserUtils.qa_password)
        basic_info_card = dashboard_page.click_profile_link @driver
        @bconnected_card = basic_info_card.click_bconnected @driver
        @bconnected_card.disconnect_bconnected
        google = GooglePage.new @driver
        google.connect_calcentral_to_google(UserUtils.qa_gmail_username, UserUtils.qa_gmail_password)
      end

      context 'when connected' do
        it 'shows "connected"' 

      end

      context 'when disconnecting' do
        it 'keeps you connected if you\'re not sure' 

        it 'disconnects you if you\'re sure' 

      end

      context 'when connected as a user without current student classes' do
        it 'shows no "class calendar" option for a non-student' 

      end

    end
  end
end

