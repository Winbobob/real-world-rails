require 'rails_helper'

describe PullRequestsDecorator do

  before do
    100.times do
      FactoryBot.create :pull_request, body: 'happy 24 pull requests!'
    end
  end

  subject { PullRequestsDecorator.new(PullRequest.all) }

  describe '#attributes' do

    it 'gives me the correct count' 


    it 'gives me the correct page count' 


    it 'gives me only the keys I want' 


  end

end

