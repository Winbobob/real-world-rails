# coding: utf-8

require 'spec_helper'
require 'transpec/syntax/pending'

module Transpec
  class Syntax
    describe Pending do
      include_context 'parsed objects'
      include_context 'syntax object', Pending, :pending_object

      let(:record) { pending_object.report.records.last }

      describe '#conversion_target?' do
        let(:target_node) do
          ast.each_node(:send).find do |send_node|
            method_name = send_node.children[1]
            method_name == :pending
          end
        end

        let(:pending_object) do
          Pending.new(target_node, runtime_data)
        end

        subject { pending_object.conversion_target? }

        context 'when #pending specification node inside of an example is passed' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'will be skipped' 

              end
            END
          end

          context 'without runtime information' do
            it { should be_true }
          end

          context 'with runtime information' do
            include_context 'dynamic analysis objects'
            it { should be_true }
          end
        end

        context 'when #pending example node is passed' do
          let(:source) do
            <<-END
              describe 'example' do
                pending 'will be skipped' do
                end
              end
            END
          end

          context 'without runtime information' do
            it { should be_false }
          end

          context 'with runtime information' do
            include_context 'dynamic analysis objects'
            it { should be_false }
          end
        end
      end

      describe '#convert_deprecated_syntax!' do
        before do
          pending_object.convert_deprecated_syntax!
        end

        context 'with expression `pending`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'will be skipped' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'will be skipped' 

              end
            END
          end

          it 'converts to `skip` form' 


          it 'adds record `pending` -> `skip`' 

        end

        context "with expression `pending 'some reason'`" do
          let(:source) do
            <<-END
              describe 'example' do
                it 'will be skipped' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'will be skipped' 

              end
            END
          end

          it "converts to `skip 'some reason` form" 


          it 'adds record `pending` -> `skip`' 

        end

        context 'with expression singleline `pending { do_something_fail }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          it 'converts to `pending; do_something_fail` form' 


          it 'adds record `pending { do_something_fail }` -> `pending; do_something_fail`' 

        end

        context "with expression singleline `pending('some reason') { do_something_fail }`" do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          it "converts to `pending('some reason'); do_something_fail` form" 

        end

        context 'with expression multiline `pending { do_something_fail }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          it 'converts to `pending; do_something_fail` form' 


          context 'and the block body includes an empty line' do
            let(:source) do
              <<-END
                describe 'example' do
                  it 'is expected to fail' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  it 'is expected to fail' 

                end
              END
            end

            it 'properly converts' 

          end
        end

        context "with expression multiline `pending('some reason') { do_something_fail }`" do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          it "converts to `pending('some reason'); do_something_fail` form" 

        end

        context 'with expression multiline `pending { do_something_fail }` ' \
                'but the body is not indented' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          it 'converts to `pending; do_something_fail` form' 

        end

        context 'with expression multiline `pending { do_something_fail }` ' \
                'but the body is outdented' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          it 'converts to `pending; do_something_fail` form' 

        end

        context 'with expression multiline `pending { do_something_fail }` ' \
                'but anomalistically the beginning and the body of block are same line' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          it 'converts to `pending; do_something_fail` form' 

        end

        context 'with expression multiline `pending { do_something_fail }` ' \
                'but anomalistically the body and the end of block are same line' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'is expected to fail' 

              end
            END
          end

          it 'converts to `pending; do_something_fail` form' 

        end
      end
    end
  end
end

