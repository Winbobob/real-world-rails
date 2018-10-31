# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Metrics::BlockLength, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Max' => 2, 'CountComments' => false } }

  shared_examples 'ignoring an offense on an excluded method' do |excluded|
    before { cop_config['ExcludedMethods'] = [excluded] }

    it 'still rejects other methods with long blocks' 


    it 'accepts the foo method with a long block' 

  end

  it 'rejects a block with more than 5 lines' 


  it 'reports the correct beginning and end lines' 


  it 'accepts a block with less than 3 lines' 


  it 'does not count blank lines' 


  it 'accepts a block with multiline receiver and less than 3 lines of body' 


  it 'accepts empty blocks' 


  it 'rejects brace blocks too' 


  it 'properly counts nested blocks' 


  it 'does not count commented lines by default' 


  context 'when defining a class' do
    it 'does not register an offense' 

  end

  context 'when defining a module' do
    it 'does not register an offense' 

  end

  context 'when CountComments is enabled' do
    before { cop_config['CountComments'] = true }

    it 'also counts commented lines' 

  end

  context 'when ExcludedMethods is enabled' do
    it_behaves_like('ignoring an offense on an excluded method', 'foo')

    it_behaves_like('ignoring an offense on an excluded method',
                    'Gem::Specification.new')

    context 'when receiver contains whitespaces' do
      before { cop_config['ExcludedMethods'] = ['Foo::Bar.baz'] }

      it 'ignores whitespaces' 

    end

    context 'when a method is ignored, but receiver is a module' do
      before { cop_config['ExcludedMethods'] = ['baz'] }

      it 'does not report an offense' 

    end
  end
end

