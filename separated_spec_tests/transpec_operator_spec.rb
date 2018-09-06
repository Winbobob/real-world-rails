# coding: utf-8

require 'spec_helper'
require 'transpec/syntax/operator'
require 'transpec/syntax/should'

module Transpec
  class Syntax
    describe Operator do
      include ::AST::Sexp
      include_context 'parsed objects'
      include_context 'syntax object', Should, :should_object

      subject(:matcher) { should_object.operator_matcher }
      let(:record) { matcher.report.records.first }

      describe '#method_name' do
        let(:source) do
          <<-END
            describe 'example' do
              it 'is 1' 

            end
          END
        end

        it 'returns the method name' 

      end

      describe '#convert_operator!' do
        before do
          matcher.convert_operator!(parenthesize_arg)
        end

        let(:parenthesize_arg) { true }

        context 'with expression `== 1`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          it 'converts to `eq(1)` form' 


          it 'adds record `== expected` -> `eq(expected)`' 


          # Operator methods allow their argument to be in the next line,
          # but non-operator methods do not.
          #
          # [1] pry(main)> 1 ==
          # [1] pry(main)* 1
          # => true
          # [2] pry(main)> 1.eql?
          # ArgumentError: wrong number of arguments (0 for 1)
          context 'and its argument is in the next line' do
            let(:source) do
              <<-END
                describe 'example' do
                  it 'is 1' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  it 'is 1' 

                end
              END
            end

            it 'inserts parentheses properly' 


            context 'and false is passed as `parenthesize_arg` argument' do
              let(:parenthesize_arg) { false }

              it 'inserts parentheses properly because they are necessary' 

            end
          end
        end

        context 'with expression `==1`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          it 'converts to `eq(1)` form' 


          context 'and false is passed as `parenthesize_arg` argument' do
            let(:parenthesize_arg) { false }

            let(:expected_source) do
              <<-END
              describe 'example' do
                it 'is 1' 

              end
              END
            end

            it 'converts to `eq 1` form' 

          end
        end

        context 'with expression `be == 1`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          it 'converts to `eq(1)` form' 


          it 'adds record `== expected` -> `eq(expected)`' 

        end

        context 'with expression `be.==(1)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          it 'converts to `eq(1)` form' 

        end

        context 'with expression `== (2 - 1)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          it 'converts to `eq(2 - 1)` form without superfluous parentheses' 

        end

        context 'with expression `== (5 - 3) / (4 - 2)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          it 'converts to `eq((5 - 3) / (4 - 2))` form' 

        end

        context "with expression `== { 'key' => 'value' }`" do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is the hash' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is the hash' 

              end
            END
          end

          it "converts to `eq({ 'key' => 'value' })` form" 


          context 'and false is passed as `parenthesize_arg` argument' do
            let(:parenthesize_arg) { false }

            it 'inserts parentheses to avoid the hash from be interpreted as a block' 

          end
        end

        [
          [:===, 'case-equals to'],
          [:<,   'is less than'],
          [:<=,  'is less than or equals to'],
          [:>,   'is greater than'],
          [:>=,  'is greater than or equals to']
        ].each do |operator, description|
          context "with expression `#{operator} 1`" do
            let(:source) do
              <<-END
                describe 'example' do
                  it '#{description} 1' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  it '#{description} 1' 

                end
              END
            end

            it "converts to `be #{operator} 1` form" 


            it "adds record `#{operator} expected` -> `be #{operator} expected`" 

          end

          context "with expression `be #{operator} 1`" do
            let(:source) do
              <<-END
                describe 'example' do
                  it '#{description} 1' 

                end
              END
            end

            it 'does nothing' 


            it 'reports nothing' 

          end
        end

        context 'with expression `=~ /pattern/`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'matches the pattern' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'matches the pattern' 

              end
            END
          end

          it 'converts to `match(/pattern/)` form' 


          it 'adds record `=~ /pattern/` -> `match(/pattern/)` without annotation' 

        end

        context 'with expression `=~/pattern/`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'matches the pattern' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'matches the pattern' 

              end
            END
          end

          it 'converts to `match(/pattern/)` form' 

        end

        context 'with expression `be =~ /pattern/`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'matches the pattern' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'matches the pattern' 

              end
            END
          end

          it 'converts to `match(/pattern/)` form' 

        end

        context 'with expression `=~ [1, 2]`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'contains 1 and 2' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'contains 1 and 2' 

              end
            END
          end

          it 'converts to `match_array([1, 2])` form' 


          it 'adds record `=~ [1, 2]` -> `match_array([1, 2])` without annotation' 

        end

        context 'with expression `=~[1, 2]`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'contains 1 and 2' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'contains 1 and 2' 

              end
            END
          end

          it 'converts to `match_array([1, 2])` form' 

        end

        context 'with expression `be =~ [1, 2]`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'contains 1 and 2' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'contains 1 and 2' 

              end
            END
          end

          it 'converts to `match_array([1, 2])` form' 

        end

        context 'with expression `=~ variable`' do
          context 'and runtime type of the variable is array' do
            include_context 'dynamic analysis objects'

            let(:source) do
              <<-END
                describe 'example' do
                  it 'contains 1 and 2' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  it 'contains 1 and 2' 

                end
              END
            end

            it 'converts to `match_array(variable)` form' 


            it 'adds record `=~ [1, 2]` -> `match_array([1, 2])` without annotation' 

          end

          context 'and runtime type of the variable is regular expression' do
            include_context 'dynamic analysis objects'

            let(:source) do
              <<-END
                describe 'example' do
                  it 'matches to the pattern' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  it 'matches to the pattern' 

                end
              END
            end

            it 'converts to `match(variable)` form' 


            it 'adds record `=~ /pattern/` -> `match(/pattern/)` without annotation' 

          end

          context 'and runtime type of the variable is ActiveRecord::Relation' do
            include_context 'dynamic analysis objects'

            let(:source) do
              <<-END
                module ActiveRecord
                  class Relation
                  end
                end

                describe 'example' do
                  it 'matches to the pattern' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                module ActiveRecord
                  class Relation
                  end
                end

                describe 'example' do
                  it 'matches to the pattern' 

                end
              END
            end

            it 'converts to `match_array(variable)` form' 


            it 'adds record `=~ [1, 2]` -> `match_array([1, 2])` without annotation' 

          end

          context 'and no runtime type information is provided' do
            let(:source) do
              <<-END
                describe 'example' do
                  it 'matches the pattern' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  it 'matches the pattern' 

                end
              END
            end

            it 'converts to `match(variable)` form' 


            it 'adds record `=~ /pattern/` -> `match(/pattern/)` with annotation' 

          end
        end

        context 'with expression `be =~ variable`' do
          context 'and no runtime type information is provided' do
            let(:source) do
              <<-END
                describe 'example' do
                  it 'matches the pattern' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  it 'matches the pattern' 

                end
              END
            end

            it 'converts to `match(variable)` form' 


            it 'adds record `=~ /pattern/` -> `match(/pattern/)` with annotation' 

          end
        end
      end

      describe '#parenthesize!' do
        before do
          matcher.parenthesize!(always)
        end

        let(:always) { true }

        context 'when its argument is already in parentheses' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          it 'does nothing' 

        end

        context 'when its argument is not in parentheses' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          context 'and true is passed as `always` argument' do
            let(:always) { true }

            let(:expected_source) do
              <<-END
              describe 'example' do
                it 'is 1' 

              end
              END
            end

            it 'inserts parentheses' 

          end

          context 'and false is passed as `always` argument' do
            let(:always) { false }

            let(:expected_source) do
              <<-END
              describe 'example' do
                it 'is 1' 

              end
              END
            end

            it 'does not nothing' 

          end
        end

        context 'when its argument is a string literal' do
          let(:source) do
            <<-END
              describe 'example' do
                it "is 'string'" 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it "is 'string'" 

              end
            END
          end

          it 'inserts parentheses' 

        end

        context 'when its argument is a here document' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'returns the document' 

              end
            END
          end

          # (block
          #   (send nil :it
          #     (str "returns the document"))
          #   (args)
          #   (send
          #     (send nil :subject) :should
          #     (send nil :eq
          #       (str "                foo\n"))))

          it 'does nothing' 

        end

        context 'when its argument is a here document with chained method' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'returns the document' 

              end
            END
          end

          # (block
          #   (send nil :it
          #     (str "returns the document"))
          #   (args)
          #   (send
          #     (send nil :subject) :should
          #     (send nil :eq
          #       (send
          #         (str "                foo\n") :gsub
          #         (str "foo")
          #         (str "bar")))))

          it 'does nothing' 

        end

        context 'when its argument is a here document with interpolation' do
          let(:source) do
            <<-'END'
              it 'returns the document' 

            END
          end

          # (block
          #   (send nil :it
          #     (str "returns the document"))
          #   (args)
          #   (begin
          #     (lvasgn :string
          #       (str "foo"))
          #     (send
          #       (send nil :subject) :should
          #       (send nil :eq
          #         (dstr
          #           (str "                ")
          #           (begin
          #             (lvar :string))
          #           (str "\n"))))))

          it 'does nothing' 

        end
      end
    end
  end
end

