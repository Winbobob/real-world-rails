require "spec_helper"

describe ContactsController do

  before(:all) do
    unless @user = User.find_by_username('contacts_controller_spec')
      truncate_all_tables
      Language.create_english
      CuratorLevel.create_enumerated
      @user = User.gen(:username => 'contacts_controller_spec')
      unless @contact_subject = ContactSubject.first
        @contact_subject = ContactSubject.gen_if_not_exists(:title => "Fake contact subject")
      end
    end
  end

  describe 'GET new' do
    it 'should assign default parameters to contact and render new' 

    it 'should preload current user details if logged in' 

    it 'should record referred page if provided' 

  end

  describe 'POST create' do
    before :all do
      @new_contact_params = { :contact => { :name => 'A name', :email => 'test@test.com',
                                    :comments => 'Message', :contact_subject_id => 1,
                                    :user_id => 1 } }
    end

    it 'should not create or deliver email if record is invalid' 


    it 'should create contact' 


    it 'should append current user URL to message if logged in' 


    it 'should send auto response email' 


    it 'should send feedback email' 


  end

  describe '#contact_subjects' do

    it 'should return active contact subjects' 


    it 'should not return inactive contact subjects' 


  end

end

