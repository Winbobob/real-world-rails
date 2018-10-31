RSpec.describe RuboCop::Cop::RSpec::InstanceSpy do
  subject(:cop) { described_class.new }

  context 'when used with `have_received`' do
    it 'adds an offense for an instance_double with single argument' 


    it 'adds an offense for an instance_double with multiple arguments' 


    it 'ignores instance_double when it is not used with as_null_object' 

  end

  context 'when not used with `have_received`' do
    it 'does not add an offence' 

  end

  original = <<-RUBY
    it do
      foo = instance_double(Foo, :name).as_null_object
      expect(foo).to have_received(:bar)
    end
  RUBY
  corrected = <<-RUBY
    it do
      foo = instance_spy(Foo, :name)
      expect(foo).to have_received(:bar)
    end
  RUBY

  include_examples 'autocorrect', original, corrected
end

