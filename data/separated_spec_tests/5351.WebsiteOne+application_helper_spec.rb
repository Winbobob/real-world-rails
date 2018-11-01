require 'spec_helper'

describe ApplicationHelper do

  it '#date_format returns formatted date 1st Jan 2015' 


  describe '#valid_email?' do
    it 'returns true if email is valid' 


    it 'returns false if email is invalid' 

  end

  describe '#shared_meta_keywords' do
    before do
      @keywords = helper.shared_meta_keywords.split(',').map { |word| word.squish }
    end

    it 'should contain AgileVentures' 


    it 'should contain pair programming' 


    it 'should contain crowdsourced learning' 

  end

  describe '#default_meta_description' do
    it 'should include the words AgileVentures' 

  end

  describe '#custom_css_btn' do
    before(:each) do
      @custom_btn_html = helper.custom_css_btn 'this is a text', 'fa fa-icon', root_path, id: 'my-id', class: 'btn-random'
    end

    it 'should render the text "this is a text"' 


    it 'should render the icon classes "fa fa-icon"' 


    it 'should have a link to the root path' 


    it 'should have the id="my-id" and class="btn-random"' 

  end

  describe '#social_button' do
    before(:each) do
      @user = stub_model(User)
      @user.stub_chain(:authentications, :where, :first, :id).and_return(100)
      helper.stub(current_user: @user)
   end

    it 'should render the correct provider' 


    it 'should render the delete method if the option is specified' 

  end
  
  describe "#resource_name" do
    it "should return :user" 

  end
  
  describe "#resource" do
    it "should return new user with karma" 

  end
end

