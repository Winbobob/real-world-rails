# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::EmptyLineAfterSubject do
  subject(:cop) { described_class.new }

  it 'checks for empty line after subject' 


  it 'checks for empty line after subject!' 


  it 'approves empty line after subject' 


  it 'approves empty line after subject!' 


  it 'handles subjects in tests' 
        it "doesn't mind me calling a method called subject in the test" 

      end
    RUBY
  end

  it 'handles multiline subject block' 


  it 'handles subject being the latest node' 


  bad_example = <<-RUBY
  RSpec.describe User do
    subject { described_class.new }
    let(:params) { foo }
  end
  RUBY

  good_example = <<-RUBY
  RSpec.describe User do
    subject { described_class.new }

    let(:params) { foo }
  end
  RUBY

  include_examples 'autocorrect',
                   bad_example,
                   good_example
end

