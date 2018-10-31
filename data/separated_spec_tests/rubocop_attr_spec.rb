# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::Attr do
  subject(:cop) { described_class.new }

  it 'registers an offense attr' 


  it 'accepts attr when it does not take arguments' 


  it 'accepts attr when it has a receiver' 


  context 'auto-corrects' do
    it 'attr to attr_reader' 


    it 'attr, false to attr_reader' 


    it 'attr :name, true to attr_accessor :name' 


    it 'attr with multiple names to attr_reader' 

  end

  context 'offense message' do
    let(:msg_reader) { 'Do not use `attr`. Use `attr_reader` instead.' }
    let(:msg_accessor) { 'Do not use `attr`. Use `attr_accessor` instead.' }

    it 'for attr :name suggests to use attr_reader' 


    it 'for attr :name, false suggests to use attr_reader' 


    it 'for attr :name, true suggests to use attr_accessor' 


    it 'for attr with multiple names suggests to use attr_reader' 

  end
end

