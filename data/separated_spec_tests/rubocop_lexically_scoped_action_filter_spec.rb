# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::LexicallyScopedActionFilter do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when string node method is not defined' 


  it 'registers an offense when symbol node method is not defined' 


  it 'registers an offense when array string node methods are not defined' 


  it 'registers an offense when array symbol node methods are not defined' 


  it 'register an offense when using action filter in module' 


  it "doesn't register an offense when string node method is defined" 


  it "doesn't register an offense when symbol node method is defined" 


  it "doesn't register an offense when array string node methods are defined" 


  it "doesn't register an offense when array symbol node methods are defined" 


  it "doesn't register an offense when using conditional statements" 


  it "doesn't register an offense when using mixin" 


  it "doesn't register an offense when using %I literal" 

end

