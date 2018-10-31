RSpec.describe RuboCop::Cop::RSpec::BeforeAfterAll do
  subject(:cop) { described_class.new }

  def message(hook)
    "Beware of using `#{hook}` as it may cause state to leak between tests. "\
    'If you are using `rspec-rails`, and `use_transactional_fixtures` is '\
    "enabled, then records created in `#{hook}` are not automatically rolled "\
    'back.'
  end

  context 'when using before all' do
    it 'registers an offense' 

  end

  context 'when using after all' do
    it 'registers an offense' 

  end

  context 'when using before each' do
    it 'does not register an offense' 

  end

  context 'when using after each' do
    it 'does not register an offense' 

  end
end

