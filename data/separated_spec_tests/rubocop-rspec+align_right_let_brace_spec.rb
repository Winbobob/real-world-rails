RSpec.describe RuboCop::Cop::RSpec::AlignRightLetBrace do
  subject(:cop) { described_class.new }

  it 'registers offense for unaligned braces' 


  it 'works with empty file' 


  offensive_source = <<-RUBY
    let(:foo)      { a }
    let(:hi)       { ab }
    let(:blahblah) { abcd }

    let(:thing) { ignore_this }
    let(:other) {
      ignore_this_too
    }

    describe 'blah' do
      let(:blahblah) { a }
      let(:blah)     { bc }
      let(:a)        { abc }
    end
  RUBY

  corrected_source = <<-RUBY
    let(:foo)      { a    }
    let(:hi)       { ab   }
    let(:blahblah) { abcd }

    let(:thing) { ignore_this }
    let(:other) {
      ignore_this_too
    }

    describe 'blah' do
      let(:blahblah) { a   }
      let(:blah)     { bc  }
      let(:a)        { abc }
    end
  RUBY

  include_examples 'autocorrect', offensive_source, corrected_source
end

