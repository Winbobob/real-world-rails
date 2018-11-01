require 'fast_spec_helper'
require 'rspec-parameterized'

describe Gitlab::Ci::Pipeline::Expression::Statement do
  subject do
    described_class.new(text, variables)
  end

  let(:variables) do
    { 'PRESENT_VARIABLE' => 'my variable',
      EMPTY_VARIABLE: '' }
  end

  describe '.new' do
    context 'when variables are not provided' do
      it 'allows to properly initializes the statement' 

    end
  end

  describe '#parse_tree' do
    context 'when expression is empty' do
      let(:text) { '' }

      it 'raises an error' 

    end

    context 'when expression grammar is incorrect' do
      table = [
        '$VAR "text"',   # missing operator
        '== "123"',      # invalid left side
        '"some string"', # only string provided
        '$VAR ==',       # invalid right side
        'null',          # missing lexemes
        ''               # empty statement
      ]

      table.each do |syntax|
        context "when expression grammar is #{syntax.inspect}" do
          let(:text) { syntax }

          it 'raises a statement error exception' 


          it 'is an invalid statement' 

        end
      end
    end

    context 'when expression grammar is correct' do
      context 'when using an operator' do
        let(:text) { '$VAR == "value"' }

        it 'returns a reverse descent parse tree' 


        it 'is a valid statement' 

      end

      context 'when using a single token' do
        let(:text) { '$PRESENT_VARIABLE' }

        it 'returns a single token instance' 

      end
    end
  end

  describe '#evaluate' do
    using RSpec::Parameterized::TableSyntax

    where(:expression, :value) do
      '$PRESENT_VARIABLE == "my variable"' | true
      '"my variable" == $PRESENT_VARIABLE' | true
      '$PRESENT_VARIABLE == null'          | false
      '$EMPTY_VARIABLE == null'            | false
      '"" == $EMPTY_VARIABLE'              | true
      '$EMPTY_VARIABLE'                    | ''
      '$UNDEFINED_VARIABLE == null'        | true
      'null == $UNDEFINED_VARIABLE'        | true
      '$PRESENT_VARIABLE'                  | 'my variable'
      '$UNDEFINED_VARIABLE'                | nil
      "$PRESENT_VARIABLE =~ /var.*e$/"     | true
      "$PRESENT_VARIABLE =~ /^var.*/"      | false
      "$EMPTY_VARIABLE =~ /var.*/"         | false
      "$UNDEFINED_VARIABLE =~ /var.*/"     | false
      "$PRESENT_VARIABLE =~ /VAR.*/i"      | true
    end

    with_them do
      let(:text) { expression }

      it "evaluates to `#{params[:value].inspect}`" 

    end
  end

  describe '#truthful?' do
    using RSpec::Parameterized::TableSyntax

    where(:expression, :value) do
      '$PRESENT_VARIABLE == "my variable"' | true
      "$PRESENT_VARIABLE == 'no match'"    | false
      '$UNDEFINED_VARIABLE == null'        | true
      '$PRESENT_VARIABLE'                  | true
      '$UNDEFINED_VARIABLE'                | false
      '$EMPTY_VARIABLE'                    | false
      '$INVALID = 1'                       | false
      "$PRESENT_VARIABLE =~ /var.*/"       | true
      "$UNDEFINED_VARIABLE =~ /var.*/"     | false
    end

    with_them do
      let(:text) { expression }

      it "returns `#{params[:value].inspect}`" 

    end

    context 'when evaluating expression raises an error' do
      let(:text) { '$PRESENT_VARIABLE' }

      it 'returns false' 

    end
  end
end

