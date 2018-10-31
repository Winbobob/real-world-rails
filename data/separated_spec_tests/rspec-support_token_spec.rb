require 'rspec/support/source/token'

class RSpec::Support::Source
  RSpec.describe Token, :if => RSpec::Support::RubyFeatures.ripper_supported? do
    let(:target_token) do
      tokens.first
    end

    let(:tokens) do
      Token.tokens_from_ripper_tokens(ripper_tokens)
    end

    let(:ripper_tokens) do
      require 'ripper'
      Ripper.lex(source)
    end

    let(:source) do
      'puts :foo'
    end

    # [
    #   [[1, 0], :on_ident, "puts"],
    #   [[1, 4], :on_sp, " "],
    #   [[1, 5], :on_symbeg, ":"],
    #   [[1, 6], :on_ident, "foo"]
    # ]

    describe '#location' do
      it 'returns a Location object with line and column numbers' 

    end

    describe '#type' do
      it 'returns a type of the token' 

    end

    describe '#string' do
      it 'returns a source string corresponding to the token' 

    end

    describe '#==' do
      context 'when both tokens have same Ripper token' do
        it 'returns true' 

      end

      context 'when both tokens have different Ripper token' do
        it 'returns false' 

      end
    end

    describe '#inspect' do
      it 'returns a string including class name, token type and source string' 

    end
  end
end

