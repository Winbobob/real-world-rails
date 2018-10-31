# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::RescueException do
  subject(:cop) { described_class.new }

  it 'registers an offense for rescue from Exception' 


  it 'registers an offense for rescue with ::Exception' 


  it 'registers an offense for rescue with StandardError, Exception' 


  it 'registers an offense for rescue with Exception => e' 


  it 'does not register an offense for rescue with no class' 


  it 'does not register an offense for rescue with no class and => e' 


  it 'does not register an offense for rescue with other class' 


  it 'does not register an offense for rescue with other classes' 


  it 'does not register an offense for rescue with a module prefix' 


  it 'does not crash when the splat operator is used in a rescue' 


  it 'does not crash when the namespace of a rescued class is in a local ' \
     'variable' do
    inspect_source(<<-RUBY.strip_indent)
      adapter = current_adapter
      begin
      rescue adapter::ParseError
      end
    RUBY
    expect(cop.offenses.empty?).to be(true)
  end
end

