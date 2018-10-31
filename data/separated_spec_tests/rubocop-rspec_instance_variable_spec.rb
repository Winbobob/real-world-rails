RSpec.describe RuboCop::Cop::RSpec::InstanceVariable do
  subject(:cop) { described_class.new }

  it 'finds an instance variable inside a describe' 


  it 'ignores non-spec blocks' 


  it 'finds an instance variable inside a shared example' 


  it 'ignores an instance variable without describe' 


  it 'ignores an instance variable inside a dynamic class' 


  # Regression test for nevir/rubocop-rspec#115
  it 'ignores instance variables outside of specs' 


  context 'when configured with AssignmentOnly', :config do
    subject(:cop) { described_class.new(config) }

    let(:cop_config) do
      { 'AssignmentOnly' => true }
    end

    it 'flags an instance variable when it is also assigned' 


    it 'ignores an instance variable when it is not assigned' 

  end
end

