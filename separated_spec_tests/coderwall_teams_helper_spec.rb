require 'spec_helper'

RSpec.describe TeamsHelper, type: :helper do
  describe '#exact_team_exists?' do
    let(:teams) { Fabricate.build_times(3, :team) }

    it 'returns true if there is a team with exact matching name' 


    it 'returns false if there is no team with exact mathcing name' 


  end
end

