describe 'My Finances Financial Resources card', :testui => true do

  if ENV["UI_TEST"] && Settings.ui_selenium.layer != 'production'

    before(:all) do
      @driver = WebDriverUtils.launch_browser
      @splash_page = CalCentralPages::SplashPage.new @driver
      @my_finances = CalCentralPages::MyFinancesPages::MyFinancesLandingPage.new @driver
      test_user = UserUtils.load_test_users.find { |user| user['financesUi'] }

      @splash_page.load_page
      @splash_page.basic_auth test_user['uid']
      @my_finances.load_page
      @my_finances.fin_resources_list_element.when_visible WebDriverUtils.page_load_timeout
    end

    after(:all) { WebDriverUtils.quit_browser @driver }

    # Billing & Payments

    it 'includes a link to Delegate Access' 

    it 'includes a link to Electronic Funds Transfer / EFT' 

    it 'includes a link to Manage Account for EFT' 

    it 'includes a link to Payment Options' 

    it 'includes a link to Tuition and Fees' 

    it 'includes a link to Tuition and Fees Payment Plan' 

    it 'includes a link to Activate Plan for FPP' 

    it 'includes a link to Tax 1098-T Form' 

    it 'includes a link to View Form for Tax 1098-T' 

    it 'includes a link to Billing FAQ' 


    # Financial Assistance

    it 'includes a link to FAFSA' 

    it 'includes a link to Dream Act Application' 

    it 'includes a link to Financial Aid & Scholarships Office' 

    it 'includes a link to MyFinAid (aid prior to Fall 2016)' 

    it 'includes a link to Cost of Attendance' 

    it 'includes a link to Graduate Financial Support' 

    it 'includes a link to Work-Study' 

    it 'includes a link to Financial Literacy' 

    it 'includes a link to National Student Loan Database System' 

    it 'includes a link to Loan Repayment Calculator' 

    it 'includes a link to Federal Student Loans' 

    it 'includes a link to Student Advocates Office' 

    it 'includes a link to Berkeley International Office' 

    it 'includes a link to Apply for an Emergency Loan' 


    # Leaving Cal?

    it 'includes a link to Have a loan?' 

    it 'includes a link to Withdrawing or Canceling?' 


    # Summer Programs

    it 'includes a link to Schedule & Deadlines' 

    it 'includes a link to Summer Session' 


    # Your Questions Answered Here

    it 'includes a link to Cal Student Central' 

  end
end

