RSpec.describe RuboCop::Cop::RSpec::FactoryBot::CreateList, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'EnforcedStyle' => enforced_style }
  end

  context 'when EnforcedStyle is :create_list' do
    let(:enforced_style) { :create_list }

    it 'flags usage of n.times with no arguments' 


    it 'flags usage of n.times when FactoryGirl.create is used' 


    it 'flags usage of n.times when FactoryBot.create is used' 


    it 'ignores create method of other object' 


    it 'ignores create in other block' 


    it 'flags n.times with argument' 


    it 'ignores n.times when there is no create call inside' 


    it 'ignores n.times when there is other calls but create' 


    it 'flags FactoryGirl.create calls with a block' 


    include_examples 'autocorrect',
                     '5.times { create :user }',
                     'create_list :user, 5'

    include_examples 'autocorrect',
                     '5.times { create(:user, :trait) }',
                     'create_list(:user, 5, :trait)'

    include_examples 'autocorrect',
                     '5.times { create :user, :trait, key: val }',
                     'create_list :user, 5, :trait, key: val'

    include_examples 'autocorrect',
                     '5.times { FactoryGirl.create :user }',
                     'FactoryGirl.create_list :user, 5'
  end

  context 'when EnforcedStyle is :n_times' do
    let(:enforced_style) { :n_times }

    it 'flags usage of create_list' 


    it 'flags usage of FactoryGirl.create_list' 


    it 'flags usage of FactoryGirl.create_list with a block' 


    it 'ignores create method of other object' 


    include_examples 'autocorrect',
                     'create_list :user, 5',
                     '5.times { create :user }'

    include_examples 'autocorrect',
                     'create_list(:user, 5, :trait)',
                     '5.times { create(:user, :trait) }'

    include_examples 'autocorrect',
                     'create_list :user, 5, :trait, key: val',
                     '5.times { create :user, :trait, key: val }'

    include_examples 'autocorrect',
                     'FactoryGirl.create_list :user, 5',
                     '5.times { FactoryGirl.create :user }'
  end
end

