# coding: utf-8

require 'spec_helper'
require 'transpec/syntax/raise_error'
require 'transpec/syntax/should'
require 'transpec/syntax/expect'

module Transpec
  class Syntax
    describe RaiseError do
      include_context 'parsed objects'
      include_context 'syntax object', Should, :should_object
      include_context 'syntax object', Expect, :expect_object

      let(:record) { raise_error_object.report.records.first }

      describe '#remove_error_specification_with_negative_expectation!' do
        before do
          raise_error_object.remove_error_specification_with_negative_expectation!
        end

        context 'with expression `lambda { }.should raise_error(SpecificErrorClass)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'raises SpecificErrorClass' 

              end
            END
          end

          let(:raise_error_object) { should_object.raise_error_matcher }

          it 'does nothing' 


          it 'reports nothing' 

        end

        context 'with expression `expect { }.to raise_error(SpecificErrorClass)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'raises SpecificErrorClass' 

              end
            END
          end

          let(:raise_error_object) { expect_object.raise_error_matcher }

          it 'does nothing' 


          it 'reports nothing' 

        end

        context 'with expression `expect { }.should raise_error(SpecificErrorClass)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'raises SpecificErrorClass' 

              end
            END
          end

          let(:raise_error_object) { expect_object.raise_error_matcher }

          it 'does nothing' 


          it 'reports nothing' 

        end

        context 'with expression `lambda { }.should raise_error(SpecificErrorClass) { |error| ... }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'raises SpecificErrorClass' 

              end
            END
          end

          let(:raise_error_object) { should_object.raise_error_matcher }

          it 'does nothing' 


          it 'reports nothing' 

        end

        context 'with expression `expect { }.to raise_error(SpecificErrorClass) { |error| ... }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'raises SpecificErrorClass' 

              end
            END
          end

          let(:raise_error_object) { expect_object.raise_error_matcher }

          it 'does nothing' 


          it 'reports nothing' 

        end

        context 'with expression `expect { }.to raise_error(SpecificErrorClass).with_message(message)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'raises SpecificErrorClass with message' 

              end
            END
          end

          let(:raise_error_object) { expect_object.raise_error_matcher }

          it 'does nothing' 


          it 'reports nothing' 

        end

        context 'with expression `lambda { }.should_not raise_error(SpecificErrorClass)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'does not raise error' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'does not raise error' 

              end
            END
          end

          let(:raise_error_object) { should_object.raise_error_matcher }

          it 'converts to `lambda { }.should_not raise_error` form' 


          it 'adds record ' \
             '`expect { }.not_to raise_error(SpecificErrorClass)` -> `expect { }.not_to raise_error`' do
            record.old_syntax.should == 'expect { }.not_to raise_error(SpecificErrorClass)'
            record.new_syntax.should == 'expect { }.not_to raise_error'
          end
        end

        context 'with expression `expect { }.not_to raise_error(SpecificErrorClass)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'does not raise error' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'does not raise error' 

              end
            END
          end

          let(:raise_error_object) { expect_object.raise_error_matcher }

          it 'converts to `expect { }.not_to raise_error` form' 

        end

        context 'with expression `expect { }.to_not raise_error(SpecificErrorClass)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'does not raise error' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'does not raise error' 

              end
            END
          end

          let(:raise_error_object) { expect_object.raise_error_matcher }

          it 'converts to `expect { }.to_not raise_error` form' 


          it 'adds record ' \
             '`expect { }.not_to raise_error(SpecificErrorClass)` -> `expect { }.not_to raise_error`' do
            record.old_syntax.should == 'expect { }.not_to raise_error(SpecificErrorClass)'
            record.new_syntax.should == 'expect { }.not_to raise_error'
          end
        end

        context 'with expression `expect { }.not_to raise_error SpecificErrorClass`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'does not raise error' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'does not raise error' 

              end
            END
          end

          let(:raise_error_object) { expect_object.raise_error_matcher }

          it 'converts to `expect { }.not_to raise_error` form' 


          it 'adds record ' \
             '`expect { }.not_to raise_error(SpecificErrorClass)` -> `expect { }.not_to raise_error`' do
            record.old_syntax.should == 'expect { }.not_to raise_error(SpecificErrorClass)'
            record.new_syntax.should == 'expect { }.not_to raise_error'
          end
        end

        context 'with expression `expect { }.not_to raise_error(SpecificErrorClass, message)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'does not raise error' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'does not raise error' 

              end
            END
          end

          let(:raise_error_object) { expect_object.raise_error_matcher }

          it 'converts to `expect { }.not_to raise_error` form' 


          it 'adds record ' \
             '`expect { }.not_to raise_error(SpecificErrorClass, message)` -> `expect { }.not_to raise_error`' do
            record.old_syntax.should == 'expect { }.not_to raise_error(SpecificErrorClass, message)'
            record.new_syntax.should == 'expect { }.not_to raise_error'
          end
        end

        context 'with expression `expect { }.not_to raise_error(message)`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'does not raise error' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'does not raise error' 

              end
            END
          end

          let(:raise_error_object) { expect_object.raise_error_matcher }

          it 'converts to `expect { }.not_to raise_error` form' 


          it 'adds record ' \
             '`expect { }.not_to raise_error(message)` -> `expect { }.not_to raise_error`' do
            record.old_syntax.should == 'expect { }.not_to raise_error(message)'
            record.new_syntax.should == 'expect { }.not_to raise_error'
          end
        end
      end
    end
  end
end

