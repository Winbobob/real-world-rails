# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::UnpackFirst, :config do
  subject(:cop) { described_class.new(config) }

  context 'ruby version >= 2.4', :ruby24 do
    context 'registers offense' do
      it 'when using `#unpack` with `#first`' 


      it 'when using `#unpack` with square brackets' 


      it 'when using `#unpack` with dot and square brackets' 


      it 'when using `#unpack` with `#slice`' 


      it 'when using `#unpack` with `#at`' 

    end

    context 'does not register offense' do
      it 'when using `#unpack1`' 


      it 'when using `#unpack` accessing second element' 

    end

    context 'autocorrects' do
      it '`#unpack` with `#first to `#unpack1`' 


      it 'autocorrects `#unpack` with square brackets' 


      it 'autocorrects `#unpack` with dot and square brackets' 


      it 'autocorrects `#unpack` with `#slice`' 


      it 'autocorrects `#unpack` with `#at`' 

    end
  end
end

