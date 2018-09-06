# coding: utf-8

require 'spec_helper'
require 'transpec/syntax/should'

module Transpec
  class Syntax
    describe Should do
      include_context 'parsed objects'
      include_context 'syntax object', Should, :should_object

      let(:record) { should_object.report.records.first }

      describe '#matcher_node' do
        let(:matcher_name) { should_object.matcher_node.children[1] }

        context 'when the matcher is operator' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is 1' 

              end
            END
          end

          it 'returns the matcher node' 

        end

        context 'when the matcher is not operator' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is empty' 

              end
            END
          end

          it 'returns the matcher node' 

        end

        context 'when the matcher is chained by another method' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'has 2 items' 

              end
            END
          end

          it 'returns the matcher node' 

        end

        context 'when the matcher is chained by another method that is taking a block' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'has 2 items' 

              end
            END
          end

          it 'returns the first node of the chain' 

        end
      end

      describe '#operator_matcher' do
        subject { should_object.operator_matcher }

        let(:source) do
          <<-END
            describe 'example' do
              it 'is 1' 

            end
          END
        end

        it 'returns an instance of Operator' 

      end

      describe '#have_matcher' do
        subject { should_object.have_matcher }

        let(:source) do
          <<-END
            describe 'example' do
              it 'has 2 items' 

            end
          END
        end

        it 'returns an instance of Have' 

      end

      describe '#raise_error_matcher' do
        subject { should_object.raise_error_matcher }

        let(:source) do
          <<-END
            describe 'example' do
              it 'raises error' 

            end
          END
        end

        it 'returns an instance of RaiseError' 

      end

      describe '#dependent_syntaxes' do
        let(:source) do
          <<-END
            describe 'example' do
              it 'has 2 items' 

            end
          END
        end

        it 'returns an array containing #have_matcher, #operator_matcher, #raise_error_matcher' 

      end

      describe '#expectize!' do
        context 'with expression `obj.should`' do
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

          it 'converts to `expect(obj).to` form' 


          it 'adds record `obj.should` -> `expect(obj).to`' 


          context 'and #expect is available in the context by including RSpec::Matchers' do
            let(:source) do
              <<-END
                describe 'example' do
                  class TestRunner
                    include RSpec::Matchers

                    def run
                      1.should == 1
                    end
                  end

                  it 'is 1' 

                end
              END
            end

            context 'with runtime information' do
              include_context 'dynamic analysis objects'

              it 'does not raise ContextError' 

            end

            context 'without runtime information' do
              it 'raises ContextError' 

            end
          end

          context 'and #expect is not available in the context' do
            context 'and the context is determinable statically' do
              let(:source) do
                <<-END
                  describe 'example' do
                    class TestRunner
                      def run
                        1.should == 1
                      end
                    end

                    it 'is 1' 

                  end
                END
              end

              context 'with runtime information' do
                include_context 'dynamic analysis objects'

                it 'raises ContextError' 

              end

              context 'without runtime information' do
                it 'raises ContextError' 

              end
            end

            context 'and the context is not determinable statically' do
              let(:source) do
                <<-END
                  def my_eval(&block)
                    Object.new.instance_eval(&block)
                  end

                  describe 'example' do
                    it 'responds to #foo' 

                  end
                END
              end

              context 'with runtime information' do
                include_context 'dynamic analysis objects'

                it 'raises ContextError' 

              end

              context 'without runtime information' do
                it 'does not raise ContextError' 

              end
            end
          end
        end

        context 'with expression `obj.should_not`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is not 1' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is not 1' 

              end
            END
          end

          it 'converts to `expect(obj).not_to` form' 


          it 'adds record `obj.should_not` -> `expect(obj).not_to`' 


          context 'and "to_not" is passed as negative form' do
            let(:expected_source) do
              <<-END
              describe 'example' do
                it 'is not 1' 

              end
              END
            end

            it 'converts to `expect(obj).to_not` form' 


            it 'adds record `obj.should_not` -> `expect(obj).to_not`' 

          end
        end

        context 'with expression `(obj).should`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is true' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is true' 

              end
            END
          end

          it 'converts to `expect(obj).to` form without superfluous parentheses' 

        end

        context 'with expression `obj.should() == 1`' do
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

          it 'converts to `expect(obj).to == 1` form' 

        end

        [
          'lambda', 'Kernel.lambda', '::Kernel.lambda',
          'proc', 'Kernel.proc', '::Kernel.proc',
          'Proc.new', '::Proc.new',
          '->',
          'expect'
        ].each do |method|
          context "with expression `#{method} { ... }.should`" do
            let(:source) do
              <<-END
                describe 'example' do
                  it 'raises error' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  it 'raises error' 

                end
              END
            end

            it 'converts to `expect {...}.to` form' 


            it "adds record `#{method} { }.should` -> `expect { }.to`" 

          end
        end

        ['MyObject.lambda', 'MyObject.proc', 'MyObject.new'].each do |method|
          context "with expression `#{method} { ... }.should`" do
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

            it "converts to `expect(#{method} { ... }).to` form" 

          end
        end

        context 'with expression `method { ... }.should` but the subject object is not proc' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'increments all elements' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'increments all elements' 

              end
            END
          end

          it 'converts to `expect(method { ... }).to` form' 

        end
      end
    end
  end
end

