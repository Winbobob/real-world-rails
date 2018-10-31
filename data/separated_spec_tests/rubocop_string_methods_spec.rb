# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::StringMethods, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'intern' => 'to_sym' } }

  let(:source) { "'something'.intern" }
  let(:corrected) { autocorrect_source(source) }

  it 'registers an offense' 

end

