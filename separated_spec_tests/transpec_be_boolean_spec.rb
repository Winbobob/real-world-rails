# coding: utf-8

require 'spec_helper'
require 'transpec/syntax/be_boolean'

module Transpec
  class Syntax
    describe BeBoolean do
      include_context 'parsed objects'
      include_context 'syntax object', BeBoolean, :be_boolean_object

      let(:record) { be_boolean_object.report.records.last }

      describe '#convert_to_conditional_matcher!' do
        before do
          be_boolean_object.convert_to_conditional_matcher!(arg)
        end

        let(:arg) { 'be_falsey' }

        context 'with expression `be_true`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is truthy' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is truthy' 

              end
            END
          end

          it 'converts to `be_truthy`' 


          it 'adds record `be_true` -> `be_truthy`' 

        end

        context 'with expression `be_false`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is falsey' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is falsey' 

              end
            END
          end

          it 'converts to `be_falsey`' 


          it 'adds record `be_false` -> `be_falsey`' 


          context 'and "be_falsy" is passed' do
            let(:arg) { 'be_falsy' }

            let(:expected_source) do
              <<-END
              describe 'example' do
                it 'is falsey' 

              end
              END
            end

            it 'converts to `be_falsy`' 


            it 'adds record `be_false` -> `be_falsy`' 

          end
        end
      end

      describe '#convert_to_exact_matcher!' do
        before do
          be_boolean_object.convert_to_exact_matcher!
        end

        context 'with expression `be_true`' do
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

          it 'converts to `be true`' 


          it 'adds record `be_true` -> `be true`' 

        end

        context 'with expression `be_false`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is false' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is false' 

              end
            END
          end

          it 'converts to `be false`' 


          it 'adds record `be_false` -> `be false`' 

        end
      end
    end
  end
end

