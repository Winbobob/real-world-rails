describe 'User authorization', :testui => true, :order => :defined do

  if ENV["UI_TEST"] && Settings.ui_selenium.layer != 'production'

    timeout = WebDriverUtils.page_load_timeout

    before(:each) do
      @driver = WebDriverUtils.launch_browser
    end

    after(:each) do
      WebDriverUtils.quit_browser(@driver)
    end

    describe 'View-as' do

      context 'when an admin has viewed-as' do

        before(:example) do
          splash_page = CalCentralPages::SplashPage.new(@driver)
          splash_page.load_page
          splash_page.basic_auth UserUtils.admin_uid
          @toolbox_page = CalCentralPages::MyToolboxPage.new(@driver)
          @toolbox_page.load_page
          @toolbox_page.clear_all_saved_users
          @toolbox_page.clear_all_recent_users
          @toolbox_page.view_as_user('61889')
          cal_net_auth_page = CalNetAuthPage.new(@driver)
          cal_net_auth_page.login('test-300848', UserUtils.test_password)
          cal_net_auth_page.wait_until(timeout) { cal_net_auth_page.logout_conf_heading_element.visible? }
          splash_page.load_page
          splash_page.basic_auth UserUtils.admin_uid
          @toolbox_page.load_page
        end
        it 'allows the admin to see recently viewed users' 

        it 'allows the admin to save recently viewed users' 

      end

      context 'when an admin enters unauthorized re-auth credentials' do
        before(:example) do
          splash_page = CalCentralPages::SplashPage.new(@driver)
          splash_page.load_page
          splash_page.basic_auth UserUtils.admin_uid
          toolbox_page = CalCentralPages::MyToolboxPage.new(@driver)
          toolbox_page.load_page
          toolbox_page.view_as_user('61889')
        end
        it 'logs the admin out of CalCentral' 

      end

      context 'when an admin enters invalid re-auth credentials' do
        before(:example) do
          splash_page = CalCentralPages::SplashPage.new(@driver)
          splash_page.load_page
          splash_page.basic_auth UserUtils.admin_uid
          toolbox_page = CalCentralPages::MyToolboxPage.new(@driver)
          toolbox_page.load_page
          toolbox_page.view_as_user('61889')
        end
        it 'locks the admin out of CalCentral' 

      end

      context 'when an unauthorized user' do
        before(:example) do
          splash_page = CalCentralPages::SplashPage.new(@driver)
          splash_page.load_page
          splash_page.basic_auth '300848'
          @toolbox_page = CalCentralPages::MyToolboxPage.new(@driver)
          @toolbox_page.load_page
        end
        it 'offers no view-as interface' 

      end
    end

    describe 'UID / SID conversion' do

      context 'when an admin' do
        before(:example) do
          splash_page = CalCentralPages::SplashPage.new(@driver)
          splash_page.load_page
          splash_page.basic_auth UserUtils.admin_uid
          @toolbox_page = CalCentralPages::MyToolboxPage.new(@driver)
          @toolbox_page.load_page
        end
        it 'allows conversion of UID to SID' 

        it 'allows conversion of SID to UID' 

      end

      context 'when an unauthorized user' do
        before(:example) do
          splash_page = CalCentralPages::SplashPage.new(@driver)
          splash_page.load_page
          splash_page.basic_auth '300848'
          @toolbox_page = CalCentralPages::MyToolboxPage.new(@driver)
          @toolbox_page.load_page
        end
        it 'offers no UID/SID conversion interface' 

      end
    end

    describe 'CC admin' do

      context 'when an admin' do
        before(:example) do
          splash_page = CalCentralPages::SplashPage.new(@driver)
          splash_page.load_page
          splash_page.basic_auth UserUtils.admin_uid
          @driver.get("#{WebDriverUtils.base_url}/ccadmin")
        end
        context 'enters unauthorized re-auth credentials' do
          it 'blocks access to CC admin' 

        end
        context 'enters invalid re-auth credentials' do
          it 'blocks access to CC admin' 

        end
      end

      context 'when an unauthorized user' do
        before(:example) do
          splash_page = CalCentralPages::SplashPage.new(@driver)
          splash_page.load_page
          splash_page.basic_auth '300848'
          @driver.get("#{WebDriverUtils.base_url}/ccadmin")
        end
        context 'enters unauthorized re-auth credentials' do
          it 'redirects the user to My Dashboard' 

        end
        context 'enters invalid re-auth credentials' do
          it 'blocks access to CC admin' 

        end
      end
    end
  end
end

