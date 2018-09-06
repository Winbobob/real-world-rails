require 'rails_helper'

describe ApplicationHelper, type: :helper do
  before do
    @user = FactoryGirl.create(:person, birthday: Date.new(1981, 4, 28), mobile_phone: '9181234567')
  end

  describe 'sanitize_html' do
    it 'should remove style tags and their content' 


    it 'should remove script tags and their content' 


    it 'should remove other illegal tags' 


    it 'should allow safe tags' 


    it 'should be html_safe' 

  end

  describe 'error_messages_for' do
    before do
      @form = Struct.new(:object)
    end

    it 'should return nothing if no errors' 


    it 'should be html_safe' 

  end

  describe 'sortable_column_heading' do
    attr_accessor :params

    it 'generates a link to the correct url' 


    it 'prepends sort arg and trails existing ones off' 


    it 'preserves other args' 

  end
end

