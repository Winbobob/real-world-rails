# coding: utf-8

require 'spec_helper'
require 'transpec/syntax/should_receive'

module Transpec
  class Syntax
    describe ShouldReceive do
      include_context 'parsed objects'
      include_context 'syntax object', ShouldReceive, :should_receive_object

      let(:record) { should_receive_object.report.records.first }

      describe '#expectize!' do
        context 'with expression `obj.should_receive(:message)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          it 'converts to `expect(obj).to receive(:message)` form' 


          it 'adds record `obj.should_receive(:message)` -> `expect(obj).to receive(:message)`' 


          context 'when the statement continues over multi lines' do
            let(:source) do
              <<-END
                describe 'example' do
                  it 'receives #foo and returns 1' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  it 'receives #foo and returns 1' 

                end
              END
            end

            it 'keeps the style as far as possible' 

          end

          context 'and #expect and #receive are not available in the context' do
            context 'and the context is determinable statically' do
              let(:source) do
                <<-END
                  describe 'example' do
                    class TestRunner
                      def run
                        something = 'something'
                        something.should_receive(:foo)
                        something.foo
                      end
                    end

                    it 'receives #foo' 

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
                    it 'receives #foo' 

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

        context 'with expression `obj.should_not_receive(:message)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'does not receive #foo' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'does not receive #foo' 

              end
            END
          end

          it 'converts to `expect(obj).not_to receive(:message)` form' 


          it 'adds record ' \
             '`obj.should_not_receive(:message)` -> `expect(obj).not_to receive(:message)`' do
            should_receive_object.expectize!
            record.old_syntax.should == 'obj.should_not_receive(:message)'
            record.new_syntax.should == 'expect(obj).not_to receive(:message)'
          end

          context 'and "to_not" is passed as negative form' do
            let(:expected_source) do
              <<-END
              describe 'example' do
                it 'does not receive #foo' 

              end
              END
            end

            it 'converts to `expect(obj).to_not receive(:message)` form' 


            it 'adds record ' \
               '`obj.should_not_receive(:message)` -> `expect(obj).to_not receive(:message)`' do
              should_receive_object.expectize!('to_not')
              record.old_syntax.should == 'obj.should_not_receive(:message)'
              record.new_syntax.should == 'expect(obj).to_not receive(:message)'
            end
          end
        end

        # Currently MessageExpectation#with supports the following syntax:
        #
        #   subject.should_receive(:foo).with do |arg|
        #     arg == 1
        #   end
        #
        # This syntax allows to expect arbitrary arguments without expect or should.
        # This is available only when #with got no normal arguments but a block,
        # and the block will not be used as a substitute implementation.
        #
        # https://github.com/rspec/rspec-mocks/blob/e6d1980/lib/rspec/mocks/message_expectation.rb#L307
        # https://github.com/rspec/rspec-mocks/blob/e6d1980/lib/rspec/mocks/argument_list_matcher.rb#L43
        #
        # Then, if you convert the example into expect syntax straightforward:
        #
        #   expect(subject).to receive(:foo).with do |arg|
        #     arg == 1
        #   end
        #
        # The do..end block is taken by the #to method, because {..} blocks have higher precedence
        # over do..end blocks. This behavior breaks the spec.
        #
        # To keep the same meaning of syntax, the block needs to be {..} form literal:
        #
        #   expect(subject).to receive(:foo).with { |arg|
        #     arg == 1
        #   }
        #
        context 'with expression `obj.should_receive(:message).with do .. end`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo with 1' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'receives #foo with 1' 

              end
            END
          end

          it 'converts to `expect(obj).to receive(:message) { .. }` form' 

        end

        # If #with take normal arguments, the block won't be used as an argument matcher.
        context 'with expression `obj.should_receive(:message).with(arg) do .. end`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo with 1' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'receives #foo with 1' 

              end
            END
          end

          it 'converts to `expect(obj).to receive(:message).with(arg) do .. end` form' 

        end

        # In this case, the do..end block is taken by the #should_receive method.
        # This means the receiver of #once method is return value of #should_receive,
        # that is actually an instance of RSpec::Mocks::MessageExpectation.
        #
        #   subject.should_receive(:foo) do |arg|
        #     arg == 1
        #   end.once
        #
        # However with `expect(obj).to receive`, the do..end block is taken by the #to method.
        # This means the receiver of #once method is return value of #to, that is actually
        # return value of RSpec::Mocks::Matchers::Receive#setup_method_substitute
        # and it's not the instance of RSpec::Mocks::MessageExpectation.
        #
        # https://github.com/rspec/rspec-mocks/blob/9cdef17/lib/rspec/mocks/targets.rb#L19
        # https://github.com/rspec/rspec-mocks/blob/9cdef17/lib/rspec/mocks/matchers/receive.rb#L74
        #
        # Then, the following syntax will be error:
        #
        #   expect(subject).to receive(:foo) do |arg|
        #     arg == 1
        #   end.once
        #
        # So the block needs to be {..} form literal also in this case.
        #
        #   expect(subject).to receive(:foo) { |arg|
        #     arg == 1
        #   }.once
        #
        context 'with expression `obj.should_receive(:message) do .. end.once`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo with 1' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'receives #foo with 1' 

              end
            END
          end

          it 'converts to `expect(obj).to receive(:message) { .. }.once` form' 

        end

        # This case, do..end block works without problem.
        context 'with expression `obj.should_receive(:message) do .. end`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo with 1' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'receives #foo with 1' 

              end
            END
          end

          it 'converts to `expect(obj).to receive(:message) do .. end` form' 

        end

        context 'with expression `Klass.any_instance.should_receive(:message)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          it 'converts to `expect_any_instance_of(Klass).to receive(:message)` form' 


          it 'adds record `Klass.any_instance.should_receive(:message)` ' \
             '-> `expect_any_instance_of(Klass).to receive(:message)`' do
            should_receive_object.expectize!
            record.old_syntax.should == 'Klass.any_instance.should_receive(:message)'
            record.new_syntax.should == 'expect_any_instance_of(Klass).to receive(:message)'
          end

          context 'when the statement continues over multi lines' do
            let(:source) do
              <<-END
                describe 'example' do
                  it 'receives #foo and returns 1' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  it 'receives #foo and returns 1' 

                end
              END
            end

            it 'keeps the style as far as possible' 

          end
        end

        context 'with expression `described_class.any_instance.should_receive(:message)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          it 'converts to `expect_any_instance_of(described_class).to receive(:message)` form' 


          it 'adds record `Klass.any_instance.should_receive(:message)` ' \
             '-> `expect_any_instance_of(Klass).to receive(:message)`' do
            should_receive_object.expectize!
            record.old_syntax.should == 'Klass.any_instance.should_receive(:message)'
            record.new_syntax.should == 'expect_any_instance_of(Klass).to receive(:message)'
          end
        end

        context 'with expression `variable.any_instance.should_receive(:message)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          it 'converts to `expect_any_instance_of(variable).to receive(:message)` form' 


          it 'adds record `Klass.any_instance.should_receive(:message)` ' \
             '-> `expect_any_instance_of(Klass).to receive(:message)`' do
            should_receive_object.expectize!
            record.old_syntax.should == 'Klass.any_instance.should_receive(:message)'
            record.new_syntax.should == 'expect_any_instance_of(Klass).to receive(:message)'
          end
        end

        context 'with expression `variable.should_receive(:message)` ' \
                'and the variable is an AnyInstance::Recorder' do
          context 'with runtime information' do
            include_context 'dynamic analysis objects'

            let(:source) do
              <<-END
                describe 'example' do
                  it 'receives #foo' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  it 'receives #foo' 

                end
              END
            end

            it 'converts to `expect_any_instance_of(Klass).to receive(:message)` form' 


            it 'adds record `Klass.any_instance.should_receive(:message)` ' \
               '-> `expect_any_instance_of(Klass).to receive(:message)`' do
              should_receive_object.expectize!
              record.old_syntax.should == 'Klass.any_instance.should_receive(:message)'
              record.new_syntax.should == 'expect_any_instance_of(Klass).to receive(:message)'
            end
          end
        end
      end

      describe '#useless_expectation?' do
        subject { should_receive_object.useless_expectation? }

        context 'with expression `obj.should_receive(:message).any_number_of_times`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          it { should be_true }
        end

        context 'with expression `obj.should_receive(:message).with(arg).any_number_of_times`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'responds to #foo with 1' 

              end
            END
          end

          it { should be_true }
        end

        context 'with expression `obj.should_receive(:message).at_least(0)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          it { should be_true }
        end

        context 'with expression `obj.should_receive(:message).at_least(1)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo at least once' 

              end
            END
          end

          it { should be_false }
        end

        context 'with expression `obj.should_receive(:message)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives to #foo' 

              end
            END
          end

          it { should be_false }
        end
      end

      describe '#allowize_useless_expectation!' do
        context 'with expression `obj.should_receive(:message).any_number_of_times`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          it 'converts to `allow(obj).to receive(:message)` form' 


          it 'adds record ' \
             '`obj.should_receive(:message).any_number_of_times` -> `allow(obj).to receive(:message)`' do
            should_receive_object.allowize_useless_expectation!
            record.old_syntax.should == 'obj.should_receive(:message).any_number_of_times'
            record.new_syntax.should == 'allow(obj).to receive(:message)'
          end

          context 'and #allow and #receive are not available in the context' do
            context 'and the context is determinable statically' do
              let(:source) do
                <<-END
                  describe 'example' do
                    class TestRunner
                      def run
                        'something'.should_receive(:foo).any_number_of_times
                      end
                    end

                    it 'responds to #foo' 

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

        context 'with expression `Klass.any_instance.should_receive(:message).any_number_of_times`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          it 'converts to `allow_any_instance_of(Klass).to receive(:message)` form' 


          it 'adds record `Klass.any_instance.should_receive(:message).any_number_of_times` ' \
             '-> `allow_any_instance_of(Klass).to receive(:message)`' do
            should_receive_object.allowize_useless_expectation!
            record.old_syntax.should == 'Klass.any_instance.should_receive(:message).any_number_of_times'
            record.new_syntax.should == 'allow_any_instance_of(Klass).to receive(:message)'
          end
        end

        context 'with expression `described_class.any_instance.should_receive(:message).any_number_of_times`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          it 'converts to `allow_any_instance_of(described_class).to receive(:message)` form' 


          it 'adds record `Klass.any_instance.should_receive(:message).any_number_of_times` ' \
             '-> `allow_any_instance_of(Klass).to receive(:message)`' do
            should_receive_object.allowize_useless_expectation!
            record.old_syntax.should == 'Klass.any_instance.should_receive(:message).any_number_of_times'
            record.new_syntax.should == 'allow_any_instance_of(Klass).to receive(:message)'
          end
        end

        context 'with expression `obj.should_receive(:message).at_least(0)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          it 'converts to `allow(obj).to receive(:message)` form' 


          it 'adds record ' \
             '`obj.should_receive(:message).at_least(0)` -> `allow(obj).to receive(:message)`' do
            should_receive_object.allowize_useless_expectation!
            record.old_syntax.should == 'obj.should_receive(:message).at_least(0)'
            record.new_syntax.should == 'allow(obj).to receive(:message)'
          end
        end

        context 'with expression `Klass.any_instance.should_receive(:message).at_least(0)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          it 'converts to `allow_any_instance_of(Klass).to receive(:message)` form' 


          it 'adds record `Klass.any_instance.should_receive(:message).at_least(0)` ' \
             '-> `allow_any_instance_of(Klass).to receive(:message)`' do
            should_receive_object.allowize_useless_expectation!
            record.old_syntax.should == 'Klass.any_instance.should_receive(:message).at_least(0)'
            record.new_syntax.should == 'allow_any_instance_of(Klass).to receive(:message)'
          end
        end

        context 'with expression `obj.should_receive(:message)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives to #foo' 

              end
            END
          end

          it 'does nothing' 

        end
      end

      describe '#stubize_useless_expectation!' do
        before do
          should_receive_object.stubize_useless_expectation!
        end

        context 'with expression `obj.should_receive(:message).any_number_of_times`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'responds to #foo' 

              end
            END
          end

          it 'converts to `obj.stub(:message)` form' 


          it 'adds record ' \
             '`obj.should_receive(:message).any_number_of_times` -> `obj.stub(:message)`' do
            record.old_syntax.should == 'obj.should_receive(:message).any_number_of_times'
            record.new_syntax.should == 'obj.stub(:message)'
          end
        end

        context 'with expression `obj.should_receive(:message)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives to #foo' 

              end
            END
          end

          it 'does nothing' 

        end
      end

      describe '#remove_useless_and_return!' do
        before do
          should_receive_object.remove_useless_and_return!
        end

        context 'with expression `obj.should_receive(:message).and_return { value }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo and returns 1' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'receives #foo and returns 1' 

              end
            END
          end

          it 'converts to `obj.should_receive(:message) { value }` form' 


          it 'adds record ' \
             '`obj.should_receive(:message).and_return { value }` -> `obj.should_receive(:message) { value }`' do
            record.old_syntax.should == 'obj.should_receive(:message).and_return { value }'
            record.new_syntax.should == 'obj.should_receive(:message) { value }'
          end
        end
      end

      describe '#add_receiver_arg_to_any_instance_implementation_block!' do
        before do
          should_receive_object.add_receiver_arg_to_any_instance_implementation_block!
        end

        context 'with expression `Klass.any_instance.should_receive(:message) do |arg| .. end`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          it 'converts to `Klass.any_instance.should_receive(:message) do |instance, arg| .. end` form' 


          it 'adds record `Klass.any_instance.should_receive(:message) { |arg| }` ' \
             '-> `Klass.any_instance.should_receive(:message) { |instance, arg| }`' do
            record.old_syntax.should == 'Klass.any_instance.should_receive(:message) { |arg| }'
            record.new_syntax.should == 'Klass.any_instance.should_receive(:message) { |instance, arg| }'
          end
        end

        context 'with expression `Klass.any_instance.should_receive(:message) do .. end`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          it 'does nothing' 

        end

        context 'with expression `Klass.any_instance.should_receive(:message) do |instance| .. end`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          it 'does nothing' 

        end

        context 'with expression `obj.should_receive(:message) do |arg| .. end`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives #foo' 

              end
            END
          end

          it 'does nothing' 

        end
      end
    end
  end
end
