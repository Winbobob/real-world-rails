# coding: utf-8

require 'spec_helper'
require 'transpec/syntax/oneliner_should'

module Transpec
  class Syntax
    describe OnelinerShould do
      include_context 'parsed objects'
      include_context 'syntax object', OnelinerShould, :should_object

      let(:record) { should_object.report.records.first }

      describe '#conversion_target?' do
        let(:target_node) do
          ast.each_node(:send).find do |send_node|
            method_name = send_node.children[1]
            method_name == :should
          end
        end

        let(:should_object) do
          OnelinerShould.new(target_node, runtime_data)
        end

        subject { should_object.conversion_target? }

        context 'when one-liner #should node is passed' do
          let(:source) do
            <<-END
              describe 'example' do
                subject { 1 }
                it { should == 1 }
              end
            END
          end

          it { should be_true }

          context 'with runtime information' do
            include_context 'dynamic analysis objects'
            it { should be_true }
          end
        end

        context 'when monkey-patched #should node is passed' do
          let(:source) do
            <<-END
              describe 'example' do
                subject { 1 }
                it 'is 1' 

              end
            END
          end

          it { should be_false }
        end
      end

      describe '#matcher_node' do
        context 'when it is taking operator matcher' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should == 1 }
              end
            END
          end

          it 'returns its parent node' 

        end

        context 'when it is taking non-operator matcher without argument' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should be_empty }
              end
            END
          end

          it 'returns its argument node' 

        end

        context 'when it is taking non-operator matcher with argument' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should eq(1) }
              end
            END
          end

          it 'returns its argument node' 

        end
      end

      describe '#operator_matcher' do
        subject { should_object.operator_matcher }

        let(:source) do
          <<-END
            describe 'example' do
              it { should == 1 }
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
              it { should have(2).items }
            end
          END
        end

        it 'returns an instance of Have' 

      end

      describe '#expectize!' do
        context 'with expression `it { should be true }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should be true }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it { is_expected.to be true }
              end
            END
          end

          it 'converts to `it { is_expected.to be true }` form' 


          it 'adds record `it { should ... }` -> `it { is_expected.to ... }`' 

        end

        context 'with expression `it { should() == 1 }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should() == 1 }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it { is_expected.to == 1 }
              end
            END
          end

          it 'converts to `it { is_expected.to == 1 }` form' 

        end
      end

      describe '#convert_have_items_to_standard_should! and Have#convert_to_standard_expectation!', rspec: 2 do
        before do
          should_object.convert_have_items_to_standard_should!
          should_object.have_matcher.convert_to_standard_expectation!
        end

        context 'with expression `it { should have(2).items }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should have(2).items }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'has 2 items' 

              end
            END
          end

          it "converts to `it 'has 2 items' do subject.size.should == 2 end` form" 


          it 'adds record ' \
             '`it { should have(n).items }` -> `it \'has n items\' do subject.size.should == n end`' do
            record.old_syntax.should == 'it { should have(n).items }'
            record.new_syntax.should == "it 'has n items' do subject.size.should == n end"
          end
        end

        context 'with expression `it { should_not have(2).items }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should_not have(2).items }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'does not have 2 items' 

              end
            END
          end

          it "converts to `it 'does not have 2 items' do subject.size.should_not == 2 end` form" 


          it 'adds record `it { should_not have(n).items }`' \
             ' -> `it \'does not have n items\' do subject.size.should_not == n end`' do
            record.old_syntax.should == 'it { should_not have(n).items }'
            record.new_syntax.should == "it 'does not have n items' do subject.size.should_not == n end"
          end
        end

        context 'with expression `it { should have(1).items }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should have(1).items }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'has 1 item' 

              end
            END
          end

          it "converts to `it 'has 1 item' do subject.size.should == 1 end` form" 


          it 'adds record ' \
             '`it { should have(n).items }` -> `it \'has n items\' do subject.size.should == n end`' do
            record.old_syntax.should == 'it { should have(n).items }'
            record.new_syntax.should == "it 'has n items' do subject.size.should == n end"
          end
        end

        context 'with expression `it { should have(0).items }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should have(0).items }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'has no items' 

              end
            END
          end

          it "converts to `it 'has no items' do subject.size.should == 0 end` form" 


          it 'adds record ' \
             '`it { should have(n).items }` -> `it \'has n items\' do subject.size.should == n end`' do
            record.old_syntax.should == 'it { should have(n).items }'
            record.new_syntax.should == "it 'has n items' do subject.size.should == n end"
          end
        end

        context 'with expression `it { should have(variable).items }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should have(number_of).items }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'has number_of items' 

              end
            END
          end

          it "converts to `it 'has variable items' do subject.size.should == variable end` form" 


          it 'adds record ' \
             '`it { should have(n).items }` -> `it \'has n items\' do subject.size.should == n end`' do
            record.old_syntax.should == 'it { should have(n).items }'
            record.new_syntax.should == "it 'has n items' do subject.size.should == n end"
          end
        end

        context 'with expression `it { should_not have(0).items }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should_not have(0).items }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'does not have 0 items' 

              end
            END
          end

          it "converts to `it 'does not have 0 items' do subject.size.should_not == 0 end` form" 


          it 'adds record `it { should_not have(n).items }`' \
             ' -> `it \'does not have n items\' do subject.size.should_not == n end`' do
            record.old_syntax.should == 'it { should_not have(n).items }'
            record.new_syntax.should == "it 'does not have n items' do subject.size.should_not == n end"
          end
        end

        context 'with expression multiline `it { should have(2).items }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it {
                  should have(2).items
                }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'has 2 items' {
                  subject.size.should == 2
                }
              end
            END
          end

          it "converts to `it 'has 2 items' { subject.size.should == 2 }` form" 


          it 'adds record ' \
             '`it { should have(n).items }` -> `it \'has n items\' do subject.size.should == n end`' do
            record.old_syntax.should == 'it { should have(n).items }'
            record.new_syntax.should == "it 'has n items' do subject.size.should == n end"
          end
        end

        context "with expression `it 'has 2 items' do should have(2).items end`" do
          let(:source) do
            <<-END
              describe 'example' do
                it 'has 2 items' 

              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'has 2 items' 

              end
            END
          end

          it "converts to `it 'has 2 items' do subject.size.should == 2 end` form" 


          it 'adds record ' \
             '`it \'...\' { should have(n).items }` -> `it \'...\' do subject.size.should == n end`' do
            record.old_syntax.should == "it '...' do should have(n).items end"
            record.new_syntax.should == "it '...' do subject.size.should == n end"
          end
        end

        context 'with expression `it { should have_at_least(2).items }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should have_at_least(2).items }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'has at least 2 items' 

              end
            END
          end

          it "converts to `it 'has at least 2 items' do subject.size.should >= 2 end` form" 


          it 'adds record `it { should have_at_least(n).items }` ' \
             '-> `it \'has at least n items\' do subject.size.should >= n end`' do
            record.old_syntax.should == 'it { should have_at_least(n).items }'
            record.new_syntax.should == "it 'has at least n items' do subject.size.should >= n end"
          end
        end

        context 'with expression `it { should have(2).words }`' do
          context 'with runtime information' do
            include_context 'dynamic analysis objects'

            context 'when the subject responds to #words and #words responds to #size' do
              let(:source) do
                <<-END
                  class String
                    def words
                      split(' ')
                    end
                  end

                  describe 'a string' do
                    it { should have(2).words }
                  end
                END
              end

              let(:expected_source) do
                <<-END
                  class String
                    def words
                      split(' ')
                    end
                  end

                  describe 'a string' do
                    it 'has 2 words' 

                  end
                END
              end

              it "converts to `it 'has 2 words' do subject.words.size.should == 2 end` form" 


              it 'adds record `it { should have(n).words }` ' \
                 '-> `it \'has n words\' do subject.words.size.should == n end`' do
                record.old_syntax.should == 'it { should have(n).words }'
                record.new_syntax.should == "it 'has n words' do subject.words.size.should == n end"
              end
            end
          end
        end
      end

      describe '#convert_have_items_to_standard_expect! and Have#convert_to_standard_expectation!' do
        before do
          should_object.convert_have_items_to_standard_expect!
          should_object.have_matcher.convert_to_standard_expectation!
        end

        context 'with expression `it { should have(2).items }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should have(2).items }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'has 2 items' 

              end
            END
          end

          it "converts to `it 'has 2 items' do expect(subject.size).to eq(2) end` form" 


          it 'adds record ' \
             '`it { should have(n).items }` -> `it \'has n items\' do expect(subject.size).to eq(n) end`' do
            record.old_syntax.should == 'it { should have(n).items }'
            record.new_syntax.should == "it 'has n items' do expect(subject.size).to eq(n) end"
          end
        end

        context 'with expression `it { should_not have(2).items }`' do
          let(:source) do
            <<-END
              describe 'example' do
                it { should_not have(2).items }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                it 'does not have 2 items' 

              end
            END
          end

          it "converts to `it 'does not have 2 items' do expect(subject.size).not_to eq(2) end` form" 


          it 'adds record `it { should_not have(n).items }`' \
             ' -> `it \'does not have n items\' do expect(subject.size).not_to eq(n) end`' do
            record.old_syntax.should == 'it { should_not have(n).items }'
            record.new_syntax.should == "it 'does not have n items' do expect(subject.size).not_to eq(n) end"
          end
        end

        context 'when the oneliner #should is not directly enclosed in an example block' do
          let(:source) do
            <<-END
              describe 'example' do
                def some_method
                  should have(2).items
                end

                it { some_method }
              end
            END
          end

          let(:expected_source) do
            <<-END
              describe 'example' do
                def some_method
                  expect(subject.size).to eq(2)
                end

                it { some_method }
              end
            END
          end

          it 'does not insert example description' 


          it 'adds record ' \
             '`it { should have(n).items }` -> `it { expect(subject.size).to eq(n) }`' do
            record.old_syntax.should == 'it { should have(n).items }'
            record.new_syntax.should == 'it { expect(subject.size).to eq(n) }'
          end
        end
      end
    end
  end
end

