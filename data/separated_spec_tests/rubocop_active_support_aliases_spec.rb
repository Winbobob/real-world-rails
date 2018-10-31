# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::ActiveSupportAliases do
  subject(:cop) { described_class.new }

  describe 'String' do
    describe '#starts_with?' do
      it 'is registered as an offence' 


      it 'is autocorrected' 

    end

    describe '#start_with?' do
      it 'is not registered as an offense' 

    end

    describe '#ends_with?' do
      it 'is registered as an offense' 


      it 'is autocorrected' 

    end

    describe '#end_with?' do
      it 'is not registered as an offense' 

    end
  end

  describe 'Array' do
    describe '#append' do
      it 'is registered as an offence' 


      it 'is not autocorrected' 

    end

    describe '#<<' do
      it 'is not registered as an offense' 

    end

    describe '#prepend' do
      it 'is registered as an offence' 


      it 'is autocorrected' 

    end

    describe '#unshift' do
      it 'is not registered as an offense' 

    end
  end
end

