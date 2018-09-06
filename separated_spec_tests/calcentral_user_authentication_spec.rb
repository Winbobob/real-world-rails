describe 'User authentication', :testui => true do

  if ENV["UI_TEST"]

    before(:each) do
      @driver = WebDriverUtils.launch_browser
    end

    after(:each) do
      WebDriverUtils.quit_browser(@driver)
    end

    before(:example) do
      @cal_net_auth_page = CalNetAuthPage.new(@driver)
    end

    context 'when logging into CalCentral' do

      it 'loads the Dashboard by default' 


    end

    context 'when deep-linking into CalCentral' do

      it 'can take the user to My Dashboard' 


      context 'My Academics pages' do

        it 'can take the user to My Academics' 


        before(:example) do
          splash_page = CalCentralPages::SplashPage.new(@driver)
          splash_page.load_page
          splash_page.click_sign_in_button
          @cal_net_auth_page.login('test-300848', UserUtils.test_password)
          academics_api = ApiMyAcademicsPageSemesters.new(@driver)
          academics_api.get_json @driver
          semester = academics_api.all_student_semesters[0]
          @semester_page_path = academics_api.semester_slug(semester)
          @my_academics_page = CalCentralPages::MyAcademicsPage.new(@driver)
          @my_academics_page.load_page
          @my_academics_page.click_logout_link
          splash_page.wait_for_expected_title?
        end

        it 'can take the user to a semester page' 


        before(:example) do
          splash_page = CalCentralPages::SplashPage.new(@driver)
          splash_page.load_page
          splash_page.click_sign_in_button
          @cal_net_auth_page.login('test-300848', UserUtils.test_password)
          academics_api = ApiMyAcademicsPageSemesters.new(@driver)
          academics_api.get_json(@driver)
          semester = academics_api.all_student_semesters[0]
          course = academics_api.semester_courses(semester)[0]
          @class_page_path = academics_api.course_url(course)
          @my_academics_page = CalCentralPages::MyAcademicsPage.new(@driver)
          @my_academics_page.load_page
          @my_academics_page.click_logout_link
          splash_page.wait_for_expected_title?
        end

        it 'can take the user to a class page' 


      end

      it 'can take the user to My Finances' 


      it 'can take the user to the finances details page' 


      it 'can take the user to My Campus' 


      it 'can take the user to the Profile page' 


    end
  end
end

