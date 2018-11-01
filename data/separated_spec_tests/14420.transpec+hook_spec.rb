# coding: utf-8

require 'spec_helper'
require 'transpec/syntax/hook'

module Transpec
  class Syntax
    describe Hook do
      include_context 'parsed objects'
      include_context 'syntax object', Hook, :hook_object

      let(:record) { hook_object.report.records.last }

      describe '#convert_scope_name!' do
        before do
          hook_object.convert_scope_name!
        end

        RSpecDSL::HOOK_METHODS.each do |hook_method|
          context "with expression `#{hook_method}(:each) { }`" do
            let(:source) do
              <<-END
                describe 'example' do
                  #{hook_method}(:each) do
                    do_something
                  end
                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  #{hook_method}(:example) do
                    do_something
                  end
                end
              END
            end

            it "converts to `#{hook_method}(:example) { }` form" 


            it "adds record `#{hook_method}(:each) { }` -> `#{hook_method}(:example) { }`" 

          end
        end

        [:before, :after].each do |hook_method|
          context "with expression `#{hook_method}(:all) { }`" do
            let(:source) do
              <<-END
                describe 'example' do
                  #{hook_method}(:all) do
                    do_something
                  end
                end
              END
            end

            let(:expected_source) do
              <<-END
                describe 'example' do
                  #{hook_method}(:context) do
                    do_something
                  end
                end
              END
            end

            it "converts to `#{hook_method}(:context) { }` form" 


            it "adds record `#{hook_method}(:all) { }` -> `#{hook_method}(:context) { }`" 

          end

          context "with expression `RSpec.configure { |c| c.#{hook_method}(:each) { } }`" do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.#{hook_method}(:each) do
                    do_something
                  end
                end
              END
            end

            let(:expected_source) do
              <<-END
                RSpec.configure do |config|
                  config.#{hook_method}(:example) do
                    do_something
                  end
                end
              END
            end

            it "converts to `RSpec.configure { |c| c.#{hook_method}(:example) { } }` form" 


            it "adds record `#{hook_method}(:each) { }` -> `#{hook_method}(:example) { }`" 

          end

          context "with expression `RSpec.configure { |c| c.#{hook_method}(:suite) { } }`" do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.#{hook_method}(:suite) do
                    do_something
                  end
                end
              END
            end

            it 'does nothing' 


            it 'does not add record' 

          end
        end

        context 'with expression `before { }`' do
          let(:source) do
            <<-END
              describe 'example' do
                before do
                  do_something
                end
              end
            END
          end

          it 'does nothing' 


          it 'does not add record' 

        end

        context 'with expression `before(variable) { }`' do
          let(:source) do
            <<-END
              scope = :each

              describe 'example' do
                before(scope) do
                  do_something
                end
              end
            END
          end

          it 'does nothing' 


          it 'does not add record' 

        end

        context 'with expression `before(:each, :type => :model) { }`' do
          let(:source) do
            <<-END
              scope = :each

              describe 'example' do
                before(:each, :type => :model) do
                  do_something
                end
              end
            END
          end

          let(:expected_source) do
            <<-END
              scope = :each

              describe 'example' do
                before(:example, :type => :model) do
                  do_something
                end
              end
            END
          end

          it 'converts to `before(:example, :type => :model) { }` form' 


          it 'adds record `before(:each) { }` -> `before(:example) { }`' 

        end
      end
    end
  end
end

