require 'rails_helper'

describe Task::Update do
  let(:user) { create(:user) }
  let(:ability) { Ability.new(user) }
  let(:task) { build(:task) }

  describe '#new' do

    describe "#working_group_disabled?" do

      it 'returns true' 


    end

  end
end

