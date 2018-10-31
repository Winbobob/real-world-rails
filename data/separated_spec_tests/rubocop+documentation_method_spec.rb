# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::DocumentationMethod, :config do
  subject(:cop) { described_class.new(config) }

  let(:require_for_non_public_methods) { false }

  let(:config) do
    RuboCop::Config.new(
      'Style/CommentAnnotation' => {
        'Keywords' => %w[TODO FIXME OPTIMIZE HACK REVIEW]
      },
      'Style/DocumentationMethod' => {
        'RequireForNonPublicMethods' => require_for_non_public_methods
      }
    )
  end

  context 'when declaring methods outside a class' do
    context 'without documentation comment' do
      context 'when method is public' do
        it 'registers an offense' 


        it 'registers an offense with `end` on the same line' 

      end

      context 'when method is private' do
        it 'does not register an offense' 


        it 'does not register an offense with `end` on the same line' 


        it 'does not register an offense with inline `private`' 


        it 'does not register an offense with inline `private` and `end`' 


        context 'when required for non-public methods' do
          let(:require_for_non_public_methods) { true }

          it 'registers an offense' 


          it 'registers an offense with `end` on the same line' 


          it 'registers an offense with inline `private`' 


          it 'registers an offense with inline `private` and `end`' 

        end
      end

      context 'when method is protected' do
        it 'does not register an offense' 


        it 'does not register an offense with inline `protected`' 


        context 'when required for non-public methods' do
          let(:require_for_non_public_methods) { true }

          it 'registers an offense' 


          it 'registers an offense with inline `protected`' 

        end
      end
    end

    context 'with documentation comment' do
      it 'does not register an offense' 


      it 'does not register an offense with `end` on the same line' 

    end

    context 'with both public and private methods' do
      context 'when the public method has no documentation' do
        it 'registers an offense' 

      end

      context 'when the public method has documentation' do
        it 'does not register an offense' 

      end

      context 'when required for non-public methods' do
        let(:require_for_non_public_methods) { true }

        it 'registers an offense' 

      end
    end

    context 'when declaring methods in a class' do
      context 'without documentation comment' do
        context 'wheh method is public' do
          it 'registers an offense' 


          it 'registers an offense with `end` on the same line' 

        end

        context 'when method is private' do
          it 'does not register an offense' 


          it 'does not register an offense with inline `private`' 


          it 'does not register an offense with `end` on the same line' 


          it 'does not register an offense with inline `private` and `end`' 


          context 'when required for non-public methods' do
            let(:require_for_non_public_methods) { true }

            it 'registers an offense' 


            it 'registers an offense with inline `private`' 


            it 'registers an offense with `end` on the same line' 


            it 'registers an offense with inline `private` and `end`' 

          end
        end
      end

      context 'with documentation comment' do
        context 'when method is public' do
          it 'does not register an offense' 


          it 'does not register an offense with `end` on the same line' 

        end
      end

      context 'with annotation comment' do
        it 'registers an offense' 

      end

      context 'with directive comment' do
        it 'registers an offense' 

      end

      context 'with both public and private methods' do
        context 'when the public method has no documentation' do
          it 'registers an offense' 

        end

        context 'when the public method has documentation' do
          it 'does not register an offense' 

        end

        context 'when required for non-public methods' do
          let(:require_for_non_public_methods) { true }

          it 'registers an offense' 

        end
      end
    end

    context 'when declaring methods in a module' do
      context 'without documentation comment' do
        context 'wheh method is public' do
          it 'registers an offense' 


          it 'registers an offense with `end` on the same line' 

        end

        context 'when method is private' do
          it 'does not register an offense' 


          it 'does not register an offense with inline `private`' 


          it 'does not register an offense with `end` on the same line' 


          it 'does not register an offense with inline `private` and `end`' 


          context 'when required for non-public methods' do
            let(:require_for_non_public_methods) { true }

            it 'registers an offense' 


            it 'registers an offense with inline `private`' 


            it 'registers an offense with `end` on the same line' 


            it 'registers an offense with inline `private` and `end`' 

          end
        end
      end

      context 'with documentation comment' do
        context 'when method is public' do
          it 'does not register an offense' 


          it 'does not register an offense with `end` on the same line' 

        end
      end

      context 'with both public and private methods' do
        context 'when the public method has no documentation' do
          it 'registers an offense' 

        end

        context 'when the public method has documentation' do
          it 'does not register an offense' 

        end

        context 'when required for non-public methods' do
          let(:require_for_non_public_methods) { true }

          it 'registers an offense' 

        end
      end
    end

    context 'when declaring methods for class instance' do
      context 'without documentation comment' do
        it 'registers an offense' 


        it 'registers an offense with `end` on the same line' 

      end

      context 'with documentation comment' do
        it 'does not register an offense' 


        it 'does not register an offense with `end` on the same line' 


        context 'when method is private' do
          it 'does not register an offense with `end` on the same line' 


          it 'does not register an offense' 


          it 'does not register an offense with inline `private` and `end`' 


          it 'does not register an offense with inline `private`' 


          context 'when required for non-public methods' do
            let(:require_for_non_public_methods) { true }

            it 'registers an offense with `end` on the same line' 


            it 'registers an offense' 


            it 'registers an offense with inline `private` and `end`' 


            it 'registers an offense with inline `private`' 

          end
        end

        context 'with both public and private methods' do
          context 'when the public method has no documentation' do
            it 'registers an offense' 

          end

          context 'when the public method has documentation' do
            it 'does not register an offense' 

          end

          context 'when required for non-public methods' do
            let(:require_for_non_public_methods) { true }

            it 'registers an offense' 

          end
        end
      end
    end
  end
end

