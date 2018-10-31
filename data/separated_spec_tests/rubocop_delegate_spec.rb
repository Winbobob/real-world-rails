# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::Delegate do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'EnforceForPrefixed' => true } }
  let(:config) do
    merged = RuboCop::ConfigLoader
             .default_configuration['Rails/Delegate'].merge(cop_config)
    RuboCop::Config.new('Rails/Delegate' => merged)
  end

  it 'finds trivial delegate' 


  it 'finds trivial delegate with arguments' 


  it 'finds trivial delegate with prefix' 


  it 'ignores class methods' 


  it 'ignores non trivial delegate' 


  it 'ignores trivial delegate with mismatched arguments' 


  it 'ignores trivial delegate with optional argument with a default value' 


  it 'ignores trivial delegate with mismatched number of arguments' 


  it 'ignores trivial delegate with other prefix' 


  it 'ignores methods with arguments' 


  it 'ignores the method in the body with arguments' 


  it 'ignores private delegations' 


  it 'ignores protected delegations' 


  it 'ignores delegation with assignment' 


  it 'ignores delegation to constant' 


  it 'ignores code with no receiver' 


  context 'with EnforceForPrefixed: false' do
    let(:cop_config) do
      { 'EnforceForPrefixed' => false }
    end

    it 'ignores trivial delegate with prefix' 

  end

  context 'Ruby 2.3', :ruby23 do
    it 'ignores trivial delegate with safe navigation' 

  end

  describe '#autocorrect' do
    context 'trivial delegation' do
      let(:source) do
        <<-RUBY.strip_indent
          def bar
            foo.bar
          end
        RUBY
      end

      let(:corrected_source) do
        <<-RUBY.strip_indent
          delegate :bar, to: :foo
        RUBY
      end

      it 'autocorrects' 

    end

    context 'trivial delegation with prefix' do
      let(:source) do
        <<-RUBY.strip_indent
          def foo_bar
            foo.bar
          end
        RUBY
      end

      let(:corrected_source) do
        <<-RUBY.strip_indent
          delegate :bar, to: :foo, prefix: true
        RUBY
      end

      it 'autocorrects' 


      context 'with EnforceForPrefixed: false' do
        let(:cop_config) do
          { 'EnforceForPrefixed' => false }
        end

        it 'does not autocorrect' 

      end
    end
  end
end

