# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::PluralizationGrammar do
  subject(:cop) { described_class.new }

  before do
    inspect_source(source)
  end

  shared_examples 'enforces pluralization grammar' do |method_name|
    context "When #{method_name} is called on an unknown variable" do
      context "when using the plural form ##{method_name}s" do
        let(:source) { "some_variable.#{method_name}s" }

        it 'does not register an offense' 

      end

      context "when using the singular form ##{method_name}" do
        let(:source) { "some_method.#{method_name}" }

        it 'does not register an offense' 

      end
    end

    [-1, -1.0, 1, 1.0].each do |singular_literal|
      context "when mis-pluralizing #{method_name} with #{singular_literal}" do
        let(:source) { "#{singular_literal}.#{method_name}s.ago" }

        it 'registers an offense' 


        it 'autocorrects to be grammatically correct' 

      end

      context "when using the singular form ##{method_name}" do
        let(:source) { "#{singular_literal}.#{method_name}" }

        it 'does not register an offense' 

      end
    end

    context "when #{method_name} is called on any other literal number" do
      [-rand(2..1000),
       -rand(0...1.0),
       0,
       rand(0...1.0),
       rand(2..1000)].each do |plural_number|
        context "when using the plural form ##{method_name}s" do
          let(:source) { "#{plural_number}.#{method_name}s" }

          it 'does not register an offense' 

        end

        context "when using the singular form ##{method_name}" do
          let(:source) { "#{plural_number}.#{method_name}.from_now" }

          it 'registers an offense' 


          it 'autocorrects to be grammatically correct' 

        end
      end
    end
  end

  it_behaves_like 'enforces pluralization grammar', 'second'
  it_behaves_like 'enforces pluralization grammar', 'minute'
  it_behaves_like 'enforces pluralization grammar', 'hour'
  it_behaves_like 'enforces pluralization grammar', 'day'
  it_behaves_like 'enforces pluralization grammar', 'week'
  it_behaves_like 'enforces pluralization grammar', 'fortnight'
  it_behaves_like 'enforces pluralization grammar', 'month'
  it_behaves_like 'enforces pluralization grammar', 'year'
end

