require 'spec_helper'

describe UnavailableProjectBuilder do
  subject { described_class.new }
  context 'when an "unavailable" project doesn\'t exist' do
    it 'creates an "unavailable" project' 


    it 'returns an "unavailable" project' 

  end

  context 'when an "unavailable" project exists' do
    let!(:unavailable_project) { create(:project, name: 'Unavailable') }
    it 'doesn\'t create a duplicate unavailable project' 


    it 'returns an "unavailable" project' 

  end
end

