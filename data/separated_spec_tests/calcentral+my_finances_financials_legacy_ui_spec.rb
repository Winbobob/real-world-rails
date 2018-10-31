describe 'My Finances details page', :testui => true do

  if ENV["UI_TEST"] && Settings.ui_selenium.layer != 'production'

    include ClassLogger

    timeout = WebDriverUtils.page_event_timeout
    test_user = UserUtils.load_test_users.find { |user| user['financesUi'] }
    logger.info "Test UID is #{test_user['uid']}"

    before(:all) do
      @driver = WebDriverUtils.launch_browser
    end

    after(:all) do
      WebDriverUtils.quit_browser @driver
    end

    before(:context) do
      splash_page = CalCentralPages::SplashPage.new @driver
      splash_page.load_page
      splash_page.basic_auth test_user['uid']

      @api = ApiMyFinancialsPage.new @driver
      @api.get_json@driver

      @my_finances = CalCentralPages::MyFinancesPages::MyFinancesDetailsPage.new @driver
      @my_finances.load_page
    end

    context 'activity card' do

      context 'transaction filters' do

        it 'allow a user to filter for open charges' 


        it 'allow a user to filter for open charges containing a specified string' 


        it 'allow a user to see all transactions' 


        it 'allow a user to filter all transactions by a specified string' 


        it 'allow a user to filter all transactions by a specific term' 


        it 'allow a user to filter all transactions by a specific term and a specified string' 


        it 'allow a user to filter all transactions by a date range' 


        it 'allow a user to filter all transactions by a start date only' 


        it 'allow a user to filter all transactions by an end date only' 


        it 'allow a user to filter all transactions by a date range and a specified string' 


        it 'filter transactions by balance due by default' 


        it 'show no results when filtered by a string that does not exist' 


        it 'show no results when filtered by a date range that does not exist among transactions' 


        it 'show no results when filtered by an illogical date range' 


        it 'show a validation error if a date range is in the wrong date format' 

      end

      context 'transaction columns' do

        before(:all) do
          @my_finances.load_page
          @my_finances.search('Date Range', nil, WebDriverUtils.ui_date_input_format(Date.today - 180), '', '')
          @my_finances.show_all
        end

        it 'can be sorted by date descending' 


        it 'can be sorted by date ascending' 


        it 'can be sorted by description ascending alphabetically' 


        it 'can be sorted by description descending alphabetically' 


        it 'can be sorted by amount ascending' 


        it 'can be sorted by amount descending' 


        it 'can be sorted by transaction type ascending alphabetically' 


        it 'can be sorted by transaction type descending alphabetically' 


      end

      it 'shows the last update date' 


    end
  end
end

