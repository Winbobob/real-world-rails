# coding: utf-8

require 'spec_helper'
require 'transpec/syntax/allow'

module Transpec
  class Syntax
    describe Allow do
      include_context 'parsed objects'
      include_context 'syntax object', Allow, :allow_object

      describe '#subject_node' do
        let(:source) do
          <<-END
            describe 'example' do
              it 'is empty' 

            end
          END
        end

        it 'returns subject node' 

      end

      describe '#matcher_node' do
        context 'when the matcher is taking a block' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is empty' 

              end
            END
          end

          it 'returns send node of the matcher' 

        end

        context 'when the matcher is not taking a block' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is empty' 

              end
            END
          end

          it 'returns send node of the matcher' 

        end
      end

      describe '#receive_matcher' do
        subject { allow_object.receive_matcher }

        let(:source) do
          <<-END
            describe 'example' do
              it 'receives :foo' 

            end
          END
        end

        it 'returns an instance of Receive' 

      end

      describe '#block_node' do
        subject { allow_object.block_node }

        context 'when the #to is taking a block' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives :foo' 

              end
            END
          end

          it 'returns the block node' 

        end

        context 'when the #to is not taking a block' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives :foo' 

              end
            END
          end

          it 'returns nil' 

        end
      end
    end
  end
end

