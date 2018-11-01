require 'rails_helper'

RSpec.describe StateMigration do

  subject(:migration) { described_class.new }

  let!(:application1) do
    create(:application, :uncompleted)
  end

  let!(:application2) do
    create(:application_full_remission).tap do |a|
      create(:evidence_check, application: a)
    end
  end

  let!(:application3) do
    create(:application_full_remission).tap do |a|
      create(:evidence_check, :completed, application: a)
    end
  end

  let!(:application4) do
    create(:application_part_remission).tap do |a|
      create(:part_payment, application: a)
    end
  end

  let!(:application5) do
    create(:application_part_remission).tap do |a|
      create(:part_payment, :completed, application: a)
    end
  end

  let!(:application6) do
    create(:application_part_remission).tap do |a|
      create(:evidence_check, :completed, application: a)
      create(:part_payment, application: a)
    end
  end

  let!(:application7) do
    create(:application_part_remission).tap do |a|
      create(:evidence_check, :completed, application: a)
      create(:part_payment, :completed, application: a)
    end
  end

  let!(:application8) do
    create(:application_full_remission)
  end

  describe '#run!' do
    before do
      migration.run!
    end

    # I'm purposely using only 1 it block with lots assertions to make sure that
    # the states are set correctly on the whole database table, which would not
    # be easy to prove in isolation
    it 'sets correct states for application1' 


    it 'sets correct states for application2' 


    it 'sets correct states for application3' 


    it 'sets correct states for application4' 


    it 'sets correct states for application5' 


    it 'sets correct states for application6' 


    it 'sets correct states for application7' 


    it 'sets correct states for application8' 

  end
end

