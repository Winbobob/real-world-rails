# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::NamedSubject do
  subject(:cop) { described_class.new }

  it 'checks `it` and `specify` for explicit subject usage' 
        it "is valid" 


        specify do
          expect(subject.valid?).to be(true)
                 ^^^^^^^ Name your test subject if you need to reference it explicitly.
        end
      end
    RUBY
  end

  it 'checks before and after for explicit subject usage' 


  it 'checks around(:each) for explicit subject usage' 


  it 'ignores subject when not wrapped inside a test' 

end

