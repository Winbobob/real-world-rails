# frozen_string_literal: true

describe SearchController, :type => :controller do
  before do
    @user = alice
    @aspect = @user.aspects.first
    sign_in @user, scope: :user
  end

  describe 'query is a person' do
    it 'goes to people index page' 

  end


  describe 'query is a tag' do
    it 'goes to a tag page' 


    it 'removes dots from the query' 


    it 'stay on the page if you search for the empty hash' 

  end

  describe '#search_query' do
    it 'strips the term parameter' 


    it 'strips the q parameter' 

  end

end

