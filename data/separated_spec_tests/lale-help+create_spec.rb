require 'rails_helper'

describe Task::Create do
  let(:user) { create(:user) }
  # I don't care about permissions at this point
  let(:ability) { double('Ability', 'can?': true) }
  let(:circle) { create(:circle)}
  let(:task) { build(:task) }

  describe '#new' do

    describe "#working_group_disabled?" do

      context "when one working group is available" do
        before do
          1.times { create(:working_group, circle: circle) }
        end
        it 'returns true' 

      end

      context "when more than one working group is available" do
        before do
          2.times { create(:working_group, circle: circle) }
        end
        it 'returns false' 

      end
    end

  end
end

