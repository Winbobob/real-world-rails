RSpec.describe RuboCop::Cop::RSpec::AlignLeftLetBrace do
  subject(:cop) { described_class.new }

  it 'registers offense for unaligned braces' 


  offensive_source = <<-RUBY
    let(:foo) { bar }
    let(:hi) { baz }
    let(:blahblah) { baz }

    let(:thing) { ignore_this }
    let(:other) {
      ignore_this_too
    }

    describe 'blah' do
      let(:long_name) { thing }
      let(:blah) { thing }
      let(:a) { thing }
    end
  RUBY

  corrected_source = <<-RUBY
    let(:foo)      { bar }
    let(:hi)       { baz }
    let(:blahblah) { baz }

    let(:thing) { ignore_this }
    let(:other) {
      ignore_this_too
    }

    describe 'blah' do
      let(:long_name) { thing }
      let(:blah)      { thing }
      let(:a)         { thing }
    end
  RUBY

  include_examples 'autocorrect', offensive_source, corrected_source
end

