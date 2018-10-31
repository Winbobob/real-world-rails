module RSpec::Matchers::BuiltIn
  RSpec.describe Compound do

    let(:matcher_without_diffable) { include("foo") }

    before do
      allow(RSpec::Matchers.configuration).to receive_messages(:color? => false)
      allow(matcher_without_diffable).to receive(:diffable?).and_raise(NoMethodError)
    end

    shared_examples "making a copy" do |compound_method, copy_method|
      context "when making a copy via `#{copy_method}`" do
        it "uses a copy of the base matchers" 


        it "copies custom matchers properly so they can work even though they have singleton behavior" 

      end
    end

    shared_examples "handles blocks properly" do |meth|
      define_method :combine do |m1, m2|
        m1.__send__(meth, m2)
      end

      context "when used with a block matcher" do
        it 'executes the block only once, regardless of how many matchers are compounded' 


        context "does not work when combined with another non-block matcher" do
          example "with the block matcher first" do
            expect {
              x = 0
              expect { x += 2 }.to combine(change { x }.to(2), be_a(Proc))
            }.to fail_with(/supports_block_expectations/)
          end

          example "with the block matcher last" do
            expect {
              x = 0
              expect { x += 2 }.to combine(be_a(Proc), change { x }.to(2))
            }.to fail_with(/supports_block_expectations/)
          end
        end

        context "indicates block expectations are not supported when combined with a custom matcher that does not define `supports_block_expectations?" do
          let(:non_block_matcher) do
            Class.new do
              include ::RSpec::Matchers::Composable
              def matches?(*); true; end
            end.new
          end

          example "with the block matcher first" do
            compound = combine(change { }.to(2), non_block_matcher)
            expect(compound.supports_block_expectations?).to be false
          end

          example "with the block matcher last" do
            compound = combine(non_block_matcher, change { }.to(2))
            expect(compound.supports_block_expectations?).to be false
          end
        end

        context "forwards on any matcher block arguments as needed (such as for `yield_with_args`)" do
          obj = Object.new
          def obj.foo(print_bar=true)
            yield "bar"
            print "printing bar" if print_bar
          end

          example "with the matcher that passes block args first" do
            call_count = 0

            expect { |probe|
              call_count += 1
              obj.foo(&probe)
            }.to combine(yield_with_args(/bar/), output("printing bar").to_stdout)

            expect(call_count).to eq(1)
          end

          example "with the matcher that passes block args last" do
            call_count = 0

            expect { |probe|
              call_count += 1
              obj.foo(&probe)
            }.to combine(output("printing bar").to_stdout, yield_with_args("bar"))

            expect(call_count).to eq(1)
          end

          it "does not support two matchers that both pass arguments to the block" 

        end

        context "when used with `raise_error` (which cannot match against a wrapped block)" do
          it 'does not work when combined with `throw_symbol` (which also cannot match against a wrapped block)' 


          it 'works when `raise_error` is first' 


          it 'works when `raise_error` is last' 


          context "with nested compound matchers" do
            if meth == :or
              def expect_block
                @x = 0
                expect do
                  print "a"

                  # for or we need `raise "boom"` and one other
                  # to be wrong, so that only the `output("a").to_stdout`
                  # is correct for these specs to cover the needed
                  # behavior.
                  @x += 3
                  raise "bom"
                end
              end
            else
              def expect_block
                @x = 0
                expect do
                  print "a"
                  @x += 2
                  raise "boom"
                end
              end
            end

            it 'works when `raise_error` is first in the first compound matcher' 


            it 'works when `raise_error` is last in the first compound matcher' 


            it 'works when `raise_error` is first in the last compound matcher' 


            it 'works when `raise_error` is last in the last compound matcher' 

          end
        end
      end

      context "when given a proc and non block matchers" do
        it 'does not treat it as a block expectation expression' 

      end
    end

    context "when used as a composable matcher" do
      it 'can pass' 


      it 'can fail' 


      it 'provides a description' 

    end

    describe "expect(...).to matcher.and(other_matcher)" do

      it_behaves_like "an RSpec matcher", :valid_value => 3, :invalid_value => 4, :disallows_negation => true do
        let(:matcher) { eq(3).and be <= 3 }
      end

      context 'when using boolean AND `&` alias' do
        it_behaves_like "an RSpec matcher", :valid_value => 3, :invalid_value => 4, :disallows_negation => true do
          let(:matcher) { eq(3) & be_a(Integer) }
        end
      end

      include_examples "making a copy", :and, :dup
      include_examples "making a copy", :and, :clone
      it_behaves_like  "handles blocks properly", :and

      context 'when both matchers pass' do
        it 'passes' 

      end

      it 'has a description composed of both matcher descriptions' 


      context 'when only the first matcher fails' do
        it "fails with the first matcher's failure message" 

      end

      context 'when only the second matcher fails' do
        it "fails with the second matcher's failure message" 

      end

      context "when both mathers fail" do
        context "when both matchers have multi-line failure messages" do
          it 'fails with a well formatted message containing both sub-messages' 

        end

        context "when both matchers have single-line failure messages" do
          it 'still fails with a multi-line failure message because it reads better than keeping it on a single line' 

        end

        context "when the first matcher has a multi-line failure message" do
          it 'fails with a well formatted message containing both sub-messages' 

        end

        context "when the second matcher has a multi-line failure message" do
          it 'fails with a well formatted message containing both sub-messages' 

        end

        context "when the first matcher is diffable" do
          subject { include("foo").and be_a(String) }

          it 'is diffable' 


          context "when only first matcher fails" do
            it 'fails with a message containing a diff for first matcher' 

          end

          context "when only second matcher fails" do
            subject { include("baz").and be_an(Integer) }

            it 'fails with a message not containing a diff for first matcher' 

          end

          context "when both matcher fail" do
            subject { include("foo").and eq(35) }

            it "fails with a message containing a diff with first matcher" 

          end
        end

        context "when the first matcher does not implement #diffable?" do
          subject { matcher_without_diffable.and exist }

          it 'is not diffable' 

        end

        context "when the second matcher does not implement #diffable?" do
          subject { exist.and matcher_without_diffable }

          it 'is not diffable' 

        end

        context "when the second matcher is diffable" do
          subject { eq(35).and include("foo") }

          it 'is diffable' 


          it 'fails with a message containing a diff for second matcher' 

        end

        context "when both matchers are diffable" do
          subject { include("bar").and include("foo") }

          it 'is diffable' 


          it 'fails with a message containing diffs for both matcher' 

        end

        context "when both matchers are not diffable" do
          subject { be_a(String).and be_truthy }

          it 'is not diffable' 


          it 'fails with a message not containing any diff' 

        end
      end
    end

    describe "expect(...).not_to matcher.and(other_matcher)" do
      it "is not supported" 

    end

    describe "expect(...).to matcher.or(other_matcher)" do
      it_behaves_like "an RSpec matcher", :valid_value => 3, :invalid_value => 5, :disallows_negation => true do
        let(:matcher) { eq(3).or eq(4) }
      end

      context 'when using boolean OR `|` alias' do
        it_behaves_like "an RSpec matcher", :valid_value => 3, :invalid_value => 5, :disallows_negation => true do
          let(:matcher) { eq(3) | eq(4) }
        end
      end

      include_examples "making a copy", :or, :dup
      include_examples "making a copy", :or, :clone
      it_behaves_like  "handles blocks properly", :or

      it 'has a description composed of both matcher descriptions' 


      context 'when both matchers pass' do
        it 'passes' 

      end

      context 'when only the first matcher passes' do
        it 'passes' 

      end

      context 'when only the last matcher passes' do
        it 'passes' 

      end

      context 'when both matchers fail' do
        context "when both matchers have multi-line failure messages" do
          it 'fails with a well formatted message containing both sub-messages' 

        end

        context "when both matchers have single-line failure messages" do
          it 'still fails with a multi-line failure message because it reads better than keeping it on a single line' 

        end

        context "when the first matcher has a multi-line failure message" do
          it 'fails with a well formatted message containing both sub-messages' 

        end

        context "when the second matcher has a multi-line failure message" do
          it 'fails with a well formatted message containing both sub-messages' 

        end
      end

      context "when first matcher is diffable" do
        subject { include("foo").or eq(35) }

        it "is diffable" 


        it 'fails with a message containing diff for first matcher' 

      end

      context "when second matcher is diffable" do
        subject { eq(35).or include("foo") }

        it "is diffable" 


        it 'fails with a message containing diff for second matcher' 

      end

      context "when both matchers are diffable" do
        subject { include("foo").or include("buzz") }

        it "is diffable" 


        it 'fails with a message containing diffs for both matcher' 

      end

      context "when both matchers are not diffable" do
        subject { be_a(String).or be_an(Integer) }

        it "is not diffable" 


        it 'fails with a message containing diffs for both matcher' 

      end
    end

    context "when chaining many matchers together" do
      it 'can pass appropriately' 


      it 'fails with complete diffs if its matchers are diffable' 


      it 'fails with a complete message' 

    end

    describe "expect(...).not_to matcher.or(other_matcher)" do
      it "is not supported" 

    end
  end
end

