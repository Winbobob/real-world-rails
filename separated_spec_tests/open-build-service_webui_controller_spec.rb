require 'rails_helper'

RSpec.describe Webui::WebuiController do
  # The webui controller is an abstract controller
  # therefore we need an anoynmous rspec controller
  # https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs/anonymous-controller
  controller do
    before_action :require_admin, only: :new
    before_action :require_login, only: :show
    before_action :set_project, only: :edit

    def index
      render plain: 'anonymous controller'
    end

    # RSpec anonymous controller only support RESTful routes
    # http://stackoverflow.com/questions/7027518/no-route-matches-rspecs-anonymous-controller
    def new
      render plain: 'anonymous controller - requires_admin_privileges'
    end

    def show
      render plain: 'anonymous controller - requires_login'
    end

    def edit
      render plain: 'anonymous controller - set_project'
    end
  end

  describe 'GET index as nobody' do
    it 'is allowed when Configuration.anonymous is true' 


    it 'is not allowed when Configuration.anonymous is false' 

  end

  describe 'GET index as a user' do
    it 'is always allowed' 

  end

  describe 'require_admin before filter' do
    it 'redirects to main page for non privileged user' 


    it 'redirects to main page for nobody user' 


    it 'for admin' 

  end

  describe 'require_login before filter' do
    it 'redirects to main page for new users' 


    it 'does not redirect for a confirmed user' 

  end

  describe '#valid_xml_id' do
    it "ensures that xml_id starts with '_' or a character" 


    it 'substitutes invalid characters with underscores' 


    it 'html escapes the input' 


    it 'leaves valid characters untouched' 


    it 'prepends an underscore if id does not start with a valid character' 

  end

  describe '#set_project before filter' do
    context 'with invalid project parameter' do
      it 'raises an ActiveRecord::RecordNotFound exception' 

    end

    context 'with valid project parameter' do
      let(:project) { create(:project) }

      it 'sets the correct project' 

    end
  end
end

