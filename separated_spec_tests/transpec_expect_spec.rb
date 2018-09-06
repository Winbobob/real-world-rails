# coding: utf-8

require 'spec_helper'
require 'transpec/syntax/expect'

module Transpec
  class Syntax
    describe Expect do
      include_context 'parsed objects'
      include_context 'syntax object', Expect, :expect_object

      describe '#conversion_target?' do
        let(:target_node) do
          ast.each_node(:send).find do |send_node|
            method_name = send_node.children[1]
            method_name == :expect
          end
        end

        let(:expect_object) do
          Expect.new(target_node)
        end

        subject { expect_object.conversion_target? }

        context 'when the #expect node is chained by #to' do
          context 'and taking a matcher properly' do
            let(:source) do
              <<-END
                describe 'example' do
                  it 'is valid expectation' 

                end
              END
            end

            it { should be_true }
          end

          context 'but taking no matcher' do
            let(:source) do
              <<-END
                describe 'example' do
                  it 'is invalid expectation' 

                end
              END
            end

            it { should be_false }
          end
        end

        context 'when the #expect node is chained by #not_to' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is valid expectation' 

              end
            END
          end

          it { should be_true }
        end

        context 'when the #expect node is not chained' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is invalid expectation' 

              end
            END
          end

          it { should be_false }
        end

        context 'when the #expect node is not chained and taken as a argument by another method' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is invalid expectation' 

              end
            END
          end

          it { should be_false }
        end
      end

      describe '#subject_node' do
        context 'when the subject is a normal argument' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is empty' 

              end
            END
          end

          it 'returns the subject node' 

        end

        context 'when the subject is a block' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'raises error' 

              end
            END
          end

          it 'returns the block node' 

        end
      end

      describe '#to_node' do
        context 'when the subject is a normal argument' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is empty' 

              end
            END
          end

          it 'returns #to node' 

        end

        context 'when the subject is a block' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'raises error' 

              end
            END
          end

          it 'returns #to node' 

        end
      end

      describe '#matcher_node' do
        let(:matcher_name) { expect_object.matcher_node.children[1] }

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

        context 'when the matcher is taking a block' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives :foo' 

              end
            END
          end

          it 'returns send node of the matcher' 

        end

        context 'when the matcher is chained by another method' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives :foo twice' 

              end
            END
          end

          it 'returns the first node of the chain' 

        end

        context 'when the matcher is chained by another method that is taking a block' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'receives :foo twice' 

              end
            END
          end

          it 'returns the first node of the chain' 

        end
      end

      describe '#have_matcher' do
        subject { expect_object.have_matcher }

        let(:source) do
          <<-END
            describe 'example' do
              it 'has 2 items' 

            end
          END
        end

        it 'returns an instance of Have' 

      end

      describe '#receive_matcher' do
        subject { expect_object.receive_matcher }

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
        subject { expect_object.block_node }

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

