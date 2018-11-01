# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::DoubleStartEndWith do
  subject(:cop) { described_class.new(config) }

  context 'IncludeActiveSupportAliases: false' do
    let(:config) do
      RuboCop::Config.new(
        'Performance/DoubleStartEndWith' => {
          'IncludeActiveSupportAliases' => false
        }
      )
    end

    context 'two #start_with? calls' do
      context 'with the same receiver' do
        context 'all parameters of the second call are pure' do
          let(:source) { 'x.start_with?(a, b) || x.start_with?("c", D)' }

          it 'registers an offense' 


          it 'corrects to a single start_with?' 

        end

        context 'one of the parameters of the second call is not pure' do
          it "doesn't register an offense" 

        end
      end

      context 'with different receivers' do
        it "doesn't register an offense" 

      end
    end

    context 'two #end_with? calls' do
      context 'with the same receiver' do
        context 'all parameters of the second call are pure' do
          let(:source) { 'x.end_with?(a, b) || x.end_with?("c", D)' }

          it 'registers an offense' 


          it 'corrects to a single end_with?' 

        end

        context 'one of the parameters of the second call is not pure' do
          it "doesn't register an offense" 

        end
      end

      context 'with different receivers' do
        it "doesn't register an offense" 

      end
    end

    context 'a .start_with? and .end_with? call with the same receiver' do
      it "doesn't register an offense" 

    end

    context 'two #starts_with? calls' do
      it "doesn't register an offense" 

    end

    context 'two #ends_with? calls' do
      it "doesn't register an offense" 

    end
  end

  context 'IncludeActiveSupportAliases: true' do
    let(:config) do
      RuboCop::Config.new(
        'Performance/DoubleStartEndWith' => {
          'IncludeActiveSupportAliases' => true
        }
      )
    end

    context 'two #start_with? calls' do
      context 'with the same receiver' do
        context 'all parameters of the second call are pure' do
          let(:source) { 'x.start_with?(a, b) || x.start_with?("c", D)' }

          it 'registers an offense' 


          it 'corrects to a single start_with?' 

        end
      end
    end

    context 'two #end_with? calls' do
      context 'with the same receiver' do
        context 'all parameters of the second call are pure' do
          let(:source) { 'x.end_with?(a, b) || x.end_with?("c", D)' }

          it 'registers an offense' 


          it 'corrects to a single end_with?' 

        end
      end
    end

    context 'two #starts_with? calls' do
      context 'with the same receiver' do
        context 'all parameters of the second call are pure' do
          let(:source) { 'x.starts_with?(a, b) || x.starts_with?("c", D)' }

          it 'registers an offense' 


          it 'corrects to a single starts_with?' 

        end

        context 'one of the parameters of the second call is not pure' do
          it "doesn't register an offense" 

        end
      end

      context 'with different receivers' do
        it "doesn't register an offense" 

      end
    end

    context 'two #ends_with? calls' do
      context 'with the same receiver' do
        context 'all parameters of the second call are pure' do
          let(:source) { 'x.ends_with?(a, b) || x.ends_with?("c", D)' }

          it 'registers an offense' 


          it 'corrects to a single ends_with?' 

        end

        context 'one of the parameters of the second call is not pure' do
          it "doesn't register an offense" 

        end
      end

      context 'with different receivers' do
        it "doesn't register an offense" 

      end
    end
  end
end

