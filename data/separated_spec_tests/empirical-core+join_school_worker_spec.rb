require 'rails_helper'

describe JoinSchoolEmailWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let!(:user) { create(:user) }
    let!(:school) { create(:school) }

    it 'should send the join school email' 

  end
end

