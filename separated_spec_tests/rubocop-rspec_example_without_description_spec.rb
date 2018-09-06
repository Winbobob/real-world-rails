RSpec.describe RuboCop::Cop::RSpec::ExampleWithoutDescription, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'EnforcedStyle' => enforced_style }
  end

  context 'with EnforcedStyle `always_allow`' do
    let(:enforced_style) { 'always_allow' }

    it 'flags empty strings for description' 
        it '' 

      RUBY
    end

    it 'ignores `it` with a description' 
        it 'is good' 

      RUBY
    end

    it 'ignores `it` without an argument' 

  end

  context 'with EnforcedStyle `single_line_only`' do
    let(:enforced_style) { 'single_line_only' }

    it 'flags missing description in multi-line examples' 


    it 'ignores missing description in single-line examples' 


    it 'flags example with an empty string for description' 

  end

  context 'with EnforcedStyle `disallow`' do
    let(:enforced_style) { 'disallow' }

    it 'flags missing description in multi-line examples' 


    it 'flags missing description in single-line examples' 


    it 'ignores `it` with a description' 
        it 'is good' 

      RUBY
    end
  end
end

