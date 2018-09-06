# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::LiteralInInterpolation do
  subject(:cop) { described_class.new }

  it 'accepts empty interpolation' 


  it 'accepts interpolation of xstr' 


  it 'accepts interpolation of irange where endpoints are not literals' 


  it 'accepts interpolation of erange where endpoints are not literals' 


  shared_examples 'literal interpolation' do |literal, expected = literal|
    it "registers an offense for #{literal} in interpolation" 


    it "should have #{literal} as the message highlight" 


    it "removes interpolation around #{literal}" 


    it "removes interpolation around #{literal} when there is more text" 


    it "removes interpolation around multiple #{literal}" 


    context 'when there is non-literal and literal interpolation' do
      context 'when literal interpolation is before non-literal' do
        it 'only remove interpolation around literal' 

      end

      context 'when literal interpolation is after non-literal' do
        it 'only remove interpolation around literal' 

      end
    end

    it "registers an offense only for final #{literal} in interpolation" 

  end

  it_behaves_like('literal interpolation', 1)
  it_behaves_like('literal interpolation', -1)
  it_behaves_like('literal interpolation', '1_123', '1123')
  it_behaves_like('literal interpolation',
                  '123_456_789_123_456_789', '123456789123456789')
  it_behaves_like('literal interpolation', '1.2e-3', '0.0012')
  it_behaves_like('literal interpolation', '0xaabb', '43707')
  it_behaves_like('literal interpolation', '0o377', '255')
  it_behaves_like('literal interpolation', 2.0)
  it_behaves_like('literal interpolation', '[]', '[]')
  it_behaves_like('literal interpolation', '["a", "b"]', '[\"a\", \"b\"]')
  it_behaves_like('literal interpolation', '{"a" => "b"}', '{\"a\" => \"b\"}')
  it_behaves_like('literal interpolation', true)
  it_behaves_like('literal interpolation', false)
  it_behaves_like('literal interpolation', 'nil')
  it_behaves_like('literal interpolation', ':symbol', 'symbol')
  it_behaves_like('literal interpolation', ':"symbol"', 'symbol')
  it_behaves_like('literal interpolation', 1..2)
  it_behaves_like('literal interpolation', 1...2)

  it 'handles nested interpolations when auto-correction' 


  shared_examples 'special keywords' do |keyword|
    it "accepts strings like #{keyword}" 


    it "does not try to autocorrect strings like #{keyword}" 


    it "registers an offense for interpolation after #{keyword}" 


    it "auto-corrects literal interpolation after #{keyword}" 

  end

  it_behaves_like('special keywords', '__FILE__')
  it_behaves_like('special keywords', '__LINE__')
  it_behaves_like('special keywords', '__RUBY__')
  it_behaves_like('special keywords', '__ENCODING__')

  shared_examples 'non-special string literal interpolation' do |string|
    it "registers an offense for #{string}" 


    it "should have #{string} in the message highlight" 


    it "should remove the interpolation and quotes around #{string}" 

  end

  it_behaves_like('non-special string literal interpolation', %('foo'))
  it_behaves_like('non-special string literal interpolation', %("foo"))
end

