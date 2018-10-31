require 'rails_helper'

describe PopularityScorer do
  let(:nickname) { 'nickname' }
  let(:token) { 'token' }
  let(:project) { FactoryBot.create(:project) }
  subject(:popularity_scorer) { PopularityScorer.new(nickname, token, project) }

  describe '#score' do
    it 'returns an integer score of project popularity' 


    it 'returns a score of 5 if there are recent commits' 


    it 'returns a score of 3 if there are 5 recent issues' 


    it 'does not give more than the maximum points' 

  end

end

