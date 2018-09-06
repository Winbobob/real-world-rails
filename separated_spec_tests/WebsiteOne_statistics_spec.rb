require 'spec_helper'

describe 'StatisticsConcern' do
  before :all do
    class FakeController < ActionController::Base
      include Statistics
    end
    @time = Time.now
    @fake_controller = FakeController.new
  end

  it "gets stats for articles" 

    
  describe "gets stats for projects" do
    it "and only counts active projects " 


    it "with mixed case status" 

  end 

  it "gets stats for members" 


  it "gets stats for documents" 


  it 'get stats for pair programming minutes' 


  it 'get stats for pair scrum minutes' 


  after :all do
    Object.send(:remove_const, :FakeController)
  end
end

