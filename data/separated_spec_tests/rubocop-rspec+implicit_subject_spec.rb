RSpec.describe RuboCop::Cop::RSpec::ImplicitSubject, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'EnforcedStyle' => enforced_style }
  end

  context 'with EnforcedStyle `single_line_only`' do
    let(:enforced_style) { 'single_line_only' }

    it 'flags `is_expected` in multi-line examples' 
        it 'expect subject to be used' 

      RUBY
    end

    it 'allows `is_expected` inside `its` block, in multi-line examples' 


    it 'flags `should` in multi-line examples' 
        it 'expect subject to be used' 

      RUBY
    end

    it 'allows `is_expected` in single-line examples' 


    it 'allows `should` in single-line examples' 


    it 'does not flag methods called is_expected and should' 
        it 'uses some similar sounding methods' 

      RUBY
    end

    it 'detects usage of `is_expected` inside helper methods' 


    bad_code = <<-RUBY
      it 'works' 

    RUBY

    good_code = <<-RUBY
      it 'works' 

    RUBY

    include_examples 'autocorrect',
                     bad_code,
                     good_code

    bad_code = <<-RUBY
      it 'works' 

    RUBY

    good_code = <<-RUBY
      it 'works' 

    RUBY

    include_examples 'autocorrect',
                     bad_code,
                     good_code
  end

  context 'with EnforcedStyle `single_statement_only`' do
    let(:enforced_style) { 'single_statement_only' }

    it 'allows `is_expected` in multi-line example with single statement' 
        it 'expect subject to be used' 

      RUBY
    end

    it 'flags `is_expected` in multi-statement examples' 
        it 'expect subject to be used' 

      RUBY
    end

    bad_code = <<-RUBY
      it 'is valid' 

    RUBY

    good_code = <<-RUBY
      it 'is valid' 

    RUBY

    include_examples 'autocorrect',
                     bad_code,
                     good_code

    include_examples 'autocorrect',
                     bad_code,
                     good_code
  end

  context 'with EnforcedStyle `disallow`' do
    let(:enforced_style) { 'disallow' }

    it 'flags `is_expected` in multi-line examples' 
        it 'expect subject to be used' 

      RUBY
    end

    it 'flags `is_expected` in single-line examples' 


    it 'flags `should` in multi-line examples' 
        it 'expect subject to be used' 

      RUBY
    end

    it 'flags `should` in single-line examples' 


    it 'allows `is_expected` inside `its` block' 


    include_examples 'autocorrect',
                     'it { is_expected.to be_truthy }',
                     'it { expect(subject).to be_truthy }'

    include_examples 'autocorrect',
                     'it { should be_truthy }',
                     'it { expect(subject).to be_truthy }'

    include_examples 'autocorrect',
                     'it { should_not be_truthy }',
                     'it { expect(subject).not_to be_truthy }'
  end
end

