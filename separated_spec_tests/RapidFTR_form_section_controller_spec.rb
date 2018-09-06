require 'spec_helper'

class MockFormSection
  def initialize(is_valid = true)
    @is_valid = is_valid
  end

  attr_writer :base_language

  def valid? # rubocop:disable TrivialAccessors
    @is_valid
  end

  def create
    FormSection.new
  end

  def unique_id
    'unique_id'
  end

  def destroy
  end
end

describe FormSectionController, :type => :controller do
  before do
    user = User.new(:user_name => 'manager_of_forms')
    allow(user).to receive(:roles).and_return([Role.new(:permissions => [Permission::FORMS[:manage]])])
    fake_login user
  end

  describe 'get index' do
    it 'populate the view with all the form sections in order ignoring enabled or disabled' 


    it 'populate the view with only the specific forms fields' 


    it 'respect order' 


    it 'assigns form id' 

  end

  describe 'post create' do
    it 'should new form_section with order' 


    it 'sets flash notice if form section is valid and redirect_to edit page with a flash message' 


    it 'does not set flash notice if form section is valid and render new' 


    it 'should assign view data if form section was not valid' 


    it 'should assign the form to the new form section' 

  end

  describe 'post save_order' do
    after { FormSection.all.each(&:destroy) }

    it 'should save the order of the forms' 

  end

  describe 'post update' do
    it 'should save update if valid' 


    it 'should show errors if invalid' 

  end

  describe 'post enable' do
    it 'should toggle the given form_section to hide/show' 

  end

  describe '.new' do
    it 'should set form and form_section objects' 

  end

  describe '.edit' do
    it 'should set form and form_section objects' 

  end

  describe 'delete' do

    it 'destroys the requested form section' 


    it 'redirects to the form section list' 

  end

end

