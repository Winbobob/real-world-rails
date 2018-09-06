include InstructorInterfaceHelperSpec

describe "Integration tests for instructor interface" do
  before(:each) do
    assignment_setup
  end

  describe "Instructor login" do
    it "with valid username and password" 


    it "with invalid username and password" 

  end

  describe "Create a course" do
    it "is able to create a public course or a private course" 

  end

  describe "View Publishing Rights" do
    it 'should display teams for assignment without topic' 

  end

  # E1776 (Fall 2017)
  #
  # The tests below are no longer reflective of the current import process for topics.
  #
  # 1. There is now an additional intermediary page during the import process.
  # 2. There are now checkbox options on the initial import page to specify optional columns.
  # 3. The intermediary data structures for imports have changed (see the pull request notes).
  # 4. The new import process expects all rows in a file to have the same number of columns.
  #    That is, it expects optional columns to be common across all rows within the same file.
  #
  # describe "Import tests for assignment topics" do
  #   it 'should be valid file with 3 columns' do
  #     validate_login_and_page_content("spec/features/assignment_topic_csvs/3-col-valid_topics_import.csv", %w(expertiza mozilla), true)
  #   end
  #
  #   it 'should be a valid file with 3 or more columns' do
  #     validate_login_and_page_content("spec/features/assignment_topic_csvs/3or4-col-valid_topics_import.csv", %w(capybara cucumber), true)
  #   end
  #
  #   it 'should be a invalid csv file' do
  #     validate_login_and_page_content("spec/features/assignment_topic_csvs/invalid_topics_import.csv", %w(airtable devise), false)
  #   end
  #
  #   it 'should be an random text file' do
  #     validate_login_and_page_content("spec/features/assignment_topic_csvs/random.txt", ['this is a random file which should fail'], false)
  #   end
  # end

  describe "View assignment scores" do
    it 'is able to view scores' 

  end
end

