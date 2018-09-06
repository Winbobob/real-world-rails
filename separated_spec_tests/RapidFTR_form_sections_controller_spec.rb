require 'spec_helper'

describe Api::FormSectionsController, :type => :controller do

  before :each do
    fake_admin_login

    reset_couchdb!

    @form1 = create :form, :name => Child::FORM_NAME
    @form2 = create :form
    @form_section1 = create :form_section, :order => 10, :form => @form1
    @form_section2 = create :form_section, :visible => false, :form => @form1
    @form_section3 = create :form_section, :order => 1, :form => @form1
    @form_section4 = create :form_section, :order => 1, :form => @form2
  end

  describe 'index' do
    before :each do
      get :index, :format => :json
      @json = JSON.parse response.body
    end

    it 'should return visible form sections' 


    it 'should return by order' 


    it 'should return sections grouped by form' 

  end

  describe 'children' do
    before :each do
      get :children, :format => :json
      @json = JSON.parse response.body
    end

    it 'should return visible children form sections' 


    it 'should return by order' 

  end
end

