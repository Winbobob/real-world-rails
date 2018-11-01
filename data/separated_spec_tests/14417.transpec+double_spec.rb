# coding: utf-8

require 'spec_helper'
require 'transpec/syntax/double'

module Transpec
  class Syntax
    describe Double do
      include_context 'parsed objects'
      include_context 'syntax object', Double, :double_object

      describe '#conversion_target?' do
        let(:target_node) do
          ast.each_node(:send).find do |send_node|
            method_name = send_node.children[1]
            method_name == :double
          end
        end

        let(:double_object) do
          Double.new(target_node, runtime_data)
        end

        subject { double_object.conversion_target? }

        context 'when #double node is passed' do
          let(:source) do
            <<-END
              describe 'example' do
                it 'includes something' 

              end
            END
          end

          it { should be_true }
        end

        context 'with runtime information' do
          include_context 'dynamic analysis objects'

          context "when RSpec's #double node is passed" do
            let(:source) do
              <<-END
                describe 'example' do
                  it 'includes something' 

                end
              END
            end

            it { should be_true }
          end

          context 'when another #double node is passed' do
            let(:source) do
              <<-END
                module AnotherMockFramework
                  def setup_mocks_for_rspec
                    def double(arg)
                      arg.upcase
                    end
                  end

                  def verify_mocks_for_rspec
                  end

                  def teardown_mocks_for_rspec
                  end
                end

                RSpec.configure do |config|
                  config.mock_framework = AnotherMockFramework
                end

                describe 'example' do
                  it "is not RSpec's #double" 

                end
              END
            end

            it { should be_false }
          end
        end
      end

      describe '#method_name' do
        let(:source) do
          <<-END
            describe 'example' do
              it 'includes something' 

            end
          END
        end

        it 'returns the method name' 

      end

      describe '#convert_to_double!' do
        before do
          double_object.convert_to_double!
        end

        [:mock, :stub].each do |method|
          context "with expression `#{method}('something')`" do
            let(:source) do
              <<-END
                describe 'example' do
                  it 'includes something' 

                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  it 'includes something' 

                end
              END
            end

            it "converts to `#{method}('something')`" 


            it "adds record `#{method}('something')` -> `double('something')`" 

          end
        end

        context "with expression `double('something')`" do
          let(:source) do
            <<-END
              describe 'example' do
                it 'includes something' 

              end
            END
          end

          it 'does nothing' 


          it 'reports nothing' 

        end
      end
    end
  end
end

