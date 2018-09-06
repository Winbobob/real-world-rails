describe 'The My Dashboard task manager', :testui => true do

  if ENV["UI_TEST"]

    today = Date.today
    yesterday = Date.yesterday
    tomorrow = Date.tomorrow
    task_wait = WebDriverUtils.google_task_timeout

    before(:all) do
      @driver = WebDriverUtils.launch_browser
    end

    after(:all) do
      WebDriverUtils.quit_browser @driver
    end

    before(:context) do
      splash_page = CalCentralPages::SplashPage.new @driver
      cal_net_auth_page = CalNetAuthPage.new @driver
      splash_page.log_into_dashboard(@driver, cal_net_auth_page, UserUtils.qa_username, UserUtils.qa_password)
      bconnected_card = CalCentralPages::MyProfileBconnectedCard.new @driver
      bconnected_card.load_page
      bconnected_card.disconnect_bconnected
      google_page = GooglePage.new @driver
      google_page.connect_calcentral_to_google(UserUtils.qa_gmail_username, UserUtils.qa_gmail_password)
      @tasks_card = CalCentralPages::MyDashboardPage::MyDashboardTasksCard.new @driver
      @tasks_card.scheduled_tasks_tab_element.when_present WebDriverUtils.page_load_timeout
    end

    context 'for Google tasks' do

      before(:example) do
        @tasks_card.delete_all_tasks
      end

      context 'when adding a task' do

        it 'allows a user to create only one task at a time' 


        it 'allows a user to cancel the creation of a new task' 


        it 'requires that a new task have a title' 


        it 'requires that a new task have a valid date format' 


        it 'allows a user to create a task without a note' 


        it 'allows the user to show more overdue tasks in ascending date order' 


        it 'allows the user to show more tasks due today in ascending creation sequence' 


        it 'allows the user to show more tasks due in the future in ascending date order' 


        it 'allows the user to show more unscheduled tasks in descending creation sequence' 

      end

      context 'when editing an existing task' do

        it 'allows a user to edit the title of an existing task' 


        it 'requires that an edited task have a title' 


        it 'allows a user to make an unscheduled task overdue' 


        it 'allows a user to make an unscheduled task due today' 


        it 'allows a user to make an unscheduled task due in the future' 


        it 'allows a user to make an overdue task unscheduled' 


        it 'requires that an edited task have a valid date format' 


        it 'allows a user to add notes to an existing task' 


        it 'allows a user to edit notes on an existing task' 


        it 'allows a user to remove notes from an existing task' 


        it 'allows a user to edit multiple scheduled tasks at once' 


        it 'allows a user to cancel the edit of an existing task' 

      end

      context 'when completing tasks' do

        it 'allows the user to show more completed tasks sorted first by descending task date and then by descending task creation date' 


        it 'allows the user to mark a completed tasks as un-completed' 

      end
    end

  end
end

