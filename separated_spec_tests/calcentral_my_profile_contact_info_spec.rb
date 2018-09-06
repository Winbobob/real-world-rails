describe 'My Profile Contact Info', :testui => true, :order => :defined do

  if ENV['UI_TEST'] && Settings.ui_selenium.layer == 'local'

    include ClassLogger

    # Load a test data file.  See sample in the ui_selenium fixtures dir.
    test_users = UserUtils.load_profile_test_data
    student = test_users.first
    contact_info = student['contactInfo']
    addresses = contact_info['addresses']

    before(:all) do
      @driver = WebDriverUtils.launch_browser
      @splash_page = CalCentralPages::SplashPage.new @driver
      @cal_net_page = CalNetAuthPage.new @driver
      @my_dashboard = CalCentralPages::MyDashboardPage.new @driver
      @contact_info_card = CalCentralPages::MyProfileContactInfoCard.new @driver

      @splash_page.load_page
      @splash_page.basic_auth student['basicInfo']['uid']
      @my_dashboard.click_profile_link @driver
      @contact_info_card.click_contact_info
      @contact_info_card.wait_until(WebDriverUtils.page_load_timeout) do
        @contact_info_card.phone_label_element.visible?
        @contact_info_card.email_label_element.visible?
        @contact_info_card.address_label_element.visible?
      end
    end

    after(:all) do
      WebDriverUtils.quit_browser(@driver)
    end

    describe 'phone number' do

      before(:all) do
        # Get rid of any existing phone data
        @contact_info_card.delete_all_phones
        @possible_phone_types = %w(Local Mobile Home/Permanent)
        @phones = contact_info['phones']
      end

      describe 'adding' do

        before(:all) do
          @mobile_phone = @phones.find { |phone| phone['type'] == 'Mobile' && phone['test'] == 'adding' }
          @home_phone = @phones.find { |phone| phone['type'] == 'Home/Permanent' && phone['test'] == 'adding' }
          @local_phone = @phones.find { |phone| phone['type'] == 'Local' && phone['test'] == 'adding' }
        end

        it 'requires that a phone number be entered' 

        it 'allows a user to save a new preferred phone' 

        it 'prevents a user adding a phone of the same type as an existing one' 

        it 'allows a user to save a new non-preferred phone' 

        it 'allows a maximum number of characters to be entered in each field' 

      end

      describe 'editing' do

        before(:all) do
          @mobile_phone = @phones.find { |phone| phone['type'] == 'Mobile' && phone['test'] == 'editing' }
          @home_phone = @phones.find { |phone| phone['type'] == 'Home/Permanent' && phone['test'] == 'editing' }

          @mobile_index = @contact_info_card.phone_type_index 'Mobile'
          @home_index = @contact_info_card.phone_type_index 'Home/Permanent'
        end

        it 'allows a user to change the phone number and extension' 

        it 'allows a user to prefer a phone while editing that phone' 

        it 'does not allow a user to un-prefer a phone while editing that phone' 

        it 'does not allow a user to change the phone type' 

        it 'requires that a phone number be entered' 

        it 'does not require that a phone extension be entered' 

        it 'requires that a valid phone extension be entered' 

      end

      describe 'deleting' do

        before(:all) do
          @home_index = @contact_info_card.phone_type_index 'Home/Permanent'
          @mobile_index = @contact_info_card.phone_type_index 'Mobile'
        end

        it 'prevents a user deleting a preferred phone if there are more than two phones' 

        it 'allows a user to delete any non-preferred phone' 

      end
    end

    describe 'email address' do

      describe 'adding' do

        before do
          @contact_info_card.load_page
        end

        it 'allows a user to add an email of type "Other" only' 


      end

      describe 'editing' do

        before(:all) do
          @index = @contact_info_card.email_type_index 'Other'
        end

        it 'allows a user to prefer an "Other" type email' 

        it 'does not allow a user to un-prefer an email while editing that email' 

        it 'allows a user to change the email address' 

        it 'requires that an email address be entered' 

        it 'prevents a user changing an email type to the same type as an existing one' 

        it 'requires that the email address include the @ and . characters' 

        it 'requires that the email address include the . character' 

        it 'requires that the email address include the @ character' 

        it 'requires that the email address contain at least one . following the @' 

        it 'requires that the email address not contain @ as the first character' 

        it 'requires that the email address not contain . as the last character' 

        it 'allows a maximum of 70 email address characters to be entered' 

      end

      describe 'deleting' do

        it 'allows a user to delete an email of type Other' 


      end
    end

    describe 'address' do

      before(:all) do
        @contact_info_card.load_page
        @contact_info_card.address_label_element.when_visible WebDriverUtils.page_load_timeout
        unless @contact_info_card.address_elements.any?
          @contact_info_card.add_address(addresses[0], addresses[0]['inputs'], addresses[0]['selects'])
          @contact_info_card.wait_until(WebDriverUtils.page_load_timeout) { @contact_info_card.address_elements.any? }
        end
        @possible_address_types = %w(Local Home Diploma)
        @current_address_types = @contact_info_card.address_types
        @type = @current_address_types.first
        @index = @current_address_types.index @type
        logger.info "The address for testing is '#{@type}'"
      end

      describe 'editing' do

        addresses.each do |address|

          # A WebDriver bug prevents interaction with selects, so only the default country can be tested for now
          if address['country'] == 'United States'

            it "allows a user to enter an address for #{address['country']} with max character restrictions" 

            it "requires a user to complete certain fields for an address in #{address['country']}" 

            it "allows a user to cancel the new address in #{address['country']}" 

            it "allows a user to delete individual address fields from an address in #{address['country']}" 

            it 'prevents a user adding an address of the same type as an existing one' 


          else
            it('cannot be tested since the test data file contains a non-US address') { fail }
          end
        end
      end

      describe 'deleting' do

        it 'prevents a user deleting addresses' 


      end
    end
  end
end

