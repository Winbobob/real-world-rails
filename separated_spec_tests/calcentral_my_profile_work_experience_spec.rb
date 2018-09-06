describe 'Profile work experience card', :testui => true, :order => :defined do

  if ENV['UI_TEST'] && Settings.ui_selenium.layer == 'local'

    include ClassLogger

    # Load a test data file.  See sample in the ui_selenium fixtures dir.
    test_users = UserUtils.load_profile_test_data
    student = test_users.find { |user| user['type'] == 'student' }
    faculty = test_users.find { |user| user['type'] == 'faculty' }
    staff = test_users.find { |user| user['type'] == 'staff' }

    work_experience = student['workExperience']
    inputs_max = work_experience['inputsMaxChar']
    jobs_added = []

    before(:all) do
      @driver = WebDriverUtils.launch_browser
      @splash_page = CalCentralPages::SplashPage.new @driver
      @my_dashboard = CalCentralPages::MyDashboardPage.new @driver
    end

    context 'when the user is a student' do

      before(:all) do
        @splash_page.load_page
        @splash_page.basic_auth student['basicInfo']['uid']
        @basic_info_card = @my_dashboard.click_profile_link @driver
        @work_experience_card = @basic_info_card.click_work_experience @driver
      end

      describe 'deleting work experience entries' do

        it ('allows the user to delete all jobs') { @work_experience_card.delete_all_jobs }

      end

      describe 'adding new work experience' do

        it 'allows the user to cancel the new entry' 


        it 'requires the user to complete certain fields for the new entry' 


        it 'requires a valid date format' 


        # Add each of the 'adding' jobs in the test data file
        jobs_to_test_adds = work_experience['jobs'].select { |j| j['test'] == 'adding' }
        jobs_to_test_adds.each do |job_to_add|

          # A WebDriver bug prevents interaction with selects, so only the default selections can be tested for now
          if job_to_add['country'] == 'United States' && job_to_add['currency'] == 'USD - US Dollar' && job_to_add['payFrequency'] == 'Month'

            it "allows the user to add employer #{jobs_to_test_adds.index job_to_add}" 


          else
            it('cannot be tested since the test data file contains a non-US address, non-US currency, or non-Monthly pay frequency') { fail }
          end
        end
      end

      describe 'editing existing work experience' do

        # Replace the first job in the UI with each of the 'editing' jobs in the test data file
        jobs_to_test_edits = work_experience['jobs'].select { |j| j['test'] == 'editing' }
        jobs_to_test_edits.each do |edited_job|

          # A WebDriver bug prevents interaction with selects, so only the default selections can be tested for now
          if edited_job['country'] == 'United States' && edited_job['currency'] == 'USD - US Dollar' && edited_job['payFrequency'] == 'Month'

            it "allows the user to edit employer #{jobs_to_test_edits.index edited_job}" 


          else
            it('cannot be tested since the test data file contains a non-US address, non-US currency, or non-Monthly pay frequency') { fail }
          end
        end
      end
    end

    context 'when the user is an instructor' do

      before(:all) do
        @splash_page.load_page
        @splash_page.basic_auth faculty['basicInfo']['uid']
        @basic_info_card = @my_dashboard.click_profile_link @driver
      end

      it 'offers no work experience UI' 


    end

    context 'when the user is a staff member' do

      before(:all) do
        @splash_page.load_page
        @splash_page.basic_auth staff['basicInfo']['uid']
        @basic_info_card = @my_dashboard.click_profile_link @driver
      end

      it 'offers no work experience UI' 


    end

    after(:all) { WebDriverUtils.quit_browser @driver }

  end
end

