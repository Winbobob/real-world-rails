require File.dirname(__FILE__) + '/../spec_helper'

describe ArchivesController do
  describe 'handling GET to index' do
    before(:each) do
      month = Struct.new(:date, :posts)
      @months = [month.new(1.month.ago.utc.beginning_of_month, [mock_model(Post)])]
      allow(Post).to receive(:find_all_grouped_by_month).and_return(@months)
    end

    def do_get
      get :index
    end

    it "should be successful" 


    it "should render index template" 


    it "should assign the found months for the view" 


    it 'should find posts grouped by month' 

  end
end

