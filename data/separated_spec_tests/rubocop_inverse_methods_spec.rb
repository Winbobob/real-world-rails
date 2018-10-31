# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::InverseMethods do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new(
      'Style/InverseMethods' => {
        'InverseMethods' => {
          any?: :none?,
          even?: :odd?,
          present?: :blank?,
          include?: :exclude?,
          :== => :!=,
          :=~ => :!~,
          :< => :>=,
          :> => :<=
        },
        'InverseBlocks' => {
          select: :reject,
          select!: :reject!
        }
      }
    )
  end

  it 'registers an offense for calling !.none? with a symbol proc' 


  it 'registers an offense for calling !.none? with a block' 


  it 'allows a method call without a not' 


  it 'allows an inverse method when double negation is used' 


  it 'allows an inverse method with a block when double negation is used' 


  context 'auto-correct' do
    it 'corrects !.none? with a symbol proc to any?' 


    it 'corrects !.none? with a block to any?' 

  end

  shared_examples :all_variable_types do |variable|
    it "registers an offense for calling !#{variable}.none?" 


    it "registers an offense for calling not #{variable}.none?" 


    it "corrects !#{variable}.none? to #{variable}.any?" 


    it "corrects not #{variable}.none? to #{variable}.any?" 

  end

  it_behaves_like :all_variable_types, 'foo'
  it_behaves_like :all_variable_types, '$foo'
  it_behaves_like :all_variable_types, '@foo'
  it_behaves_like :all_variable_types, '@@foo'
  it_behaves_like :all_variable_types, 'FOO'
  it_behaves_like :all_variable_types, 'FOO::BAR'
  it_behaves_like :all_variable_types, 'foo["bar"]'
  it_behaves_like :all_variable_types, 'foo.bar'

  { any?: :none?,
    even?: :odd?,
    present?: :blank?,
    include?: :exclude?,
    none?: :any?,
    odd?: :even?,
    blank?: :present?,
    exclude?: :include? }.each do |method, inverse|
      it "registers an offense for !foo.#{method}" 


      it "corrects #{method} to #{inverse}" 

    end

  { :== => :!=,
    :!= => :==,
    :=~ => :!~,
    :!~ => :=~,
    :< => :>=,
    :> => :<= }.each do |method, inverse|
    it "registers an offense for !(foo #{method} bar)" 


    it "registers an offense for not (foo #{method} bar)" 


    it "corrects #{method} to #{inverse}" 

  end

  it 'allows comparing camel case constants on the right' 


  it 'allows comparing camel case constants on the left' 


  it 'registers an offense for comparing snake case constants on the right' 


  it 'registers an offense for comparing snake case constants on the left' 


  context 'inverse blocks' do
    { select: :reject,
      reject: :select,
      select!: :reject!,
      reject!: :select! }.each do |method, inverse|
      it "registers an offense for foo.#{method} { |e| !e }" 


      it 'registers an offense for a multiline method call where the last ' \
        'method is inverted' do
        inspect_source(<<-RUBY.strip_indent)
          foo.#{method} do |e|
            something
            !e.bar
          end
        RUBY

        expect(cop.messages)
          .to eq(["Use `#{inverse}` instead of inverting `#{method}`."])
      end

      it 'registers an offense for an inverted equality block' 


      it 'registers an offense for a multiline inverted equality block' 


      it 'registers a single offense for nested inverse method calls' 


      it 'corrects nested inverse method calls' 


      it 'corrects a simple inverted block' 


      it 'corrects an inverted method call' 


      it 'corrects a complex inverted method call' 


      it 'corrects an inverted do end method call' 


      it 'corrects a multiline method call where the last method is inverted' 


      it 'corrects an offense for an inverted equality block' 


      it 'corrects an offense for a multiline inverted equality block' 

    end
  end
end

