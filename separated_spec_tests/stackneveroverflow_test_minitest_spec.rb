# encoding: utf-8
require "minitest/autorun"
require "stringio"

class MiniSpecA < Minitest::Spec; end
class MiniSpecB < Minitest::Test; extend Minitest::Spec::DSL; end
class MiniSpecC < MiniSpecB; end
class NamedExampleA < MiniSpecA; end
class NamedExampleB < MiniSpecB; end
class NamedExampleC < MiniSpecC; end
class ExampleA; end
class ExampleB < ExampleA; end

describe Minitest::Spec do
  # helps to deal with 2.4 deprecation of Fixnum for Integer
  Int = 1.class

  # do not parallelize this suite... it just can"t handle it.

  def assert_triggered expected = "blah", klass = Minitest::Assertion
    @assertion_count += 1

    e = assert_raises(klass) do
      yield
    end

    msg = e.message.sub(/(---Backtrace---).*/m, '\1')
    msg.gsub!(/\(oid=[-0-9]+\)/, "(oid=N)")
    msg.gsub!(/@.+>/, "@PATH>")
    msg.gsub!(/(\d\.\d{6})\d+/, '\1xxx') # normalize: ruby version, impl, platform
    msg.gsub!(/:0x[a-fA-F0-9]{4,}/m, ":0xXXXXXX")

    if expected
      @assertion_count += 1
      case expected
      when String then
        assert_equal expected, msg
      when Regexp then
        @assertion_count += 1
        assert_match expected, msg
      else
        flunk "Unknown: #{expected.inspect}"
      end
    end
  end

  before do
    @assertion_count = 4
  end

  after do
    _(self.assertions).must_equal @assertion_count if passed? and not skipped?
  end

  it "needs to be able to catch a Minitest::Assertion exception" 


  it "needs to be sensible about must_include order" 


  it "needs to be sensible about wont_include order" 


  it "needs to catch an expected exception" 


  it "needs to catch an unexpected exception" 


  it "needs to ensure silence" 


  it "needs to have all methods named well" 


  it "needs to raise if an expected exception is not raised" 


  it "needs to verify binary messages" 


  it "needs to verify emptyness" 


  it "needs to verify equality" 


  it "needs to warn on equality with nil" 


  it "needs to verify floats outside a delta" 


  it "needs to verify floats outside an epsilon" 


  it "needs to verify floats within a delta" 


  it "needs to verify floats within an epsilon" 


  it "needs to verify identity" 


  it "needs to verify inequality" 


  it "needs to verify instances of a class" 


  it "needs to verify kinds of a class" 


  it "needs to verify kinds of objects" 


  it "needs to verify mismatch" 


  it "needs to verify nil" 


  it "needs to verify non-emptyness" 


  it "needs to verify non-identity" 


  it "needs to verify non-nil" 


  it "needs to verify objects not responding to a message" 


  it "needs to verify output in stderr" 


  it "needs to verify output in stdout" 


  it "needs to verify regexp matches" 


  describe "expect" do
    before do
      @assertion_count -= 3
    end

    it "can use expect" 


    it "can use expect with a lambda" 


    it "can use expect in a thread" 


    it "can NOT use must_equal in a thread. It must use expect in a thread" 

  end

  it "needs to verify throw" 


  it "needs to verify types of objects" 


  it "needs to verify using any (negative) predicate" 


  it "needs to verify using any binary operator" 


  it "needs to verify using any predicate" 


  it "needs to verify using respond_to" 

end

describe Minitest::Spec, :let do
  i_suck_and_my_tests_are_order_dependent!

  def _count
    $let_count ||= 0
  end

  let :count do
    $let_count += 1
    $let_count
  end

  it "is evaluated once per example" 


  it "is REALLY evaluated once per example" 


  it 'raises an error if the name begins with "test"' 


  it "raises an error if the name shadows a normal instance method" 


  it "doesn't raise an error if it is just another let" 


  it "procs come after dont_flip" 

end

describe Minitest::Spec, :subject do
  attr_reader :subject_evaluation_count

  subject do
    @subject_evaluation_count ||= 0
    @subject_evaluation_count  += 1
    @subject_evaluation_count
  end

  it "is evaluated once per example" 

end

class TestMetaStatic < Minitest::Test
  def test_children
    Minitest::Spec.children.clear # prevents parallel run

    y = z = nil
    x = describe "top-level thingy" do
      y = describe "first thingy" do end

      it "top-level-it" do end

      z = describe "second thingy" do end
    end

    assert_equal [x], Minitest::Spec.children
    assert_equal [y, z], x.children
    assert_equal [], y.children
    assert_equal [], z.children
  end

  def test_it_wont_remove_existing_child_test_methods
    Minitest::Spec.children.clear # prevents parallel run

    inner = nil
    outer = describe "outer" do
      inner = describe "inner" do
        it do
          assert true
        end
      end
      it do
        assert true
      end
    end

    assert_equal 1, outer.public_instance_methods.grep(/^test_/).count
    assert_equal 1, inner.public_instance_methods.grep(/^test_/).count
  end

  def test_it_wont_add_test_methods_to_children
    Minitest::Spec.children.clear # prevents parallel run

    inner = nil
    outer = describe "outer" do
      inner = describe "inner" do end
      it do
        assert true
      end
    end

    assert_equal 1, outer.public_instance_methods.grep(/^test_/).count
    assert_equal 0, inner.public_instance_methods.grep(/^test_/).count
  end
end

require "minitest/metametameta"

class TestMeta < MetaMetaMetaTestCase
  parallelize_me!

  def util_structure
    y = z = nil
    before_list = []
    after_list  = []
    x = describe "top-level thingy" do
      before { before_list << 1 }
      after  { after_list  << 1 }

      it "top-level-it" do end

      y = describe "inner thingy" do
        before { before_list << 2 }
        after  { after_list  << 2 }
        it "inner-it" do end

        z = describe "very inner thingy" do
          before { before_list << 3 }
          after  { after_list  << 3 }
          it "inner-it" do end

          it      { } # ignore me
          specify { } # anonymous it
        end
      end
    end

    return x, y, z, before_list, after_list
  end

  def test_register_spec_type
    original_types = Minitest::Spec::TYPES.dup

    assert_includes Minitest::Spec::TYPES, [//, Minitest::Spec]

    Minitest::Spec.register_spec_type(/woot/, TestMeta)

    p = lambda do |_| true end
    Minitest::Spec.register_spec_type TestMeta, &p

    keys = Minitest::Spec::TYPES.map(&:first)

    assert_includes keys, /woot/
    assert_includes keys, p
  ensure
    Minitest::Spec::TYPES.replace original_types
  end

  def test_spec_type
    original_types = Minitest::Spec::TYPES.dup

    Minitest::Spec.register_spec_type(/A$/, MiniSpecA)
    Minitest::Spec.register_spec_type MiniSpecB do |desc|
      desc.superclass == ExampleA
    end
    Minitest::Spec.register_spec_type MiniSpecC do |_desc, *addl|
      addl.include? :woot
    end

    assert_equal MiniSpecA, Minitest::Spec.spec_type(ExampleA)
    assert_equal MiniSpecB, Minitest::Spec.spec_type(ExampleB)
    assert_equal MiniSpecC, Minitest::Spec.spec_type(ExampleB, :woot)
  ensure
    Minitest::Spec::TYPES.replace original_types
  end

  def test_bug_dsl_expectations
    spec_class = Class.new MiniSpecB do
      it "should work" 

    end

    test_name = spec_class.instance_methods.sort.grep(/test/).first

    spec = spec_class.new test_name

    result = spec.run

    assert spec.passed?
    assert result.passed?
    assert_equal 1, result.assertions
  end

  def test_name
    spec_a = describe ExampleA do; end
    spec_b = describe ExampleB, :random_method do; end
    spec_c = describe ExampleB, :random_method, :addl_context do; end

    assert_equal "ExampleA", spec_a.name
    assert_equal "ExampleB::random_method", spec_b.name
    assert_equal "ExampleB::random_method::addl_context", spec_c.name
  end

  def test_name2
    assert_equal "NamedExampleA", NamedExampleA.name
    assert_equal "NamedExampleB", NamedExampleB.name
    assert_equal "NamedExampleC", NamedExampleC.name

    spec_a = describe ExampleA do; end
    spec_b = describe ExampleB, :random_method do; end

    assert_equal "ExampleA", spec_a.name
    assert_equal "ExampleB::random_method", spec_b.name
  end

  def test_structure
    x, y, z, * = util_structure

    assert_equal "top-level thingy",                                  x.to_s
    assert_equal "top-level thingy::inner thingy",                    y.to_s
    assert_equal "top-level thingy::inner thingy::very inner thingy", z.to_s

    assert_equal "top-level thingy",  x.desc
    assert_equal "inner thingy",      y.desc
    assert_equal "very inner thingy", z.desc

    top_methods = %w[setup teardown test_0001_top-level-it]
    inner_methods1 = %w[setup teardown test_0001_inner-it]
    inner_methods2 = inner_methods1 +
      %w[test_0002_anonymous test_0003_anonymous]

    assert_equal top_methods,    x.instance_methods(false).sort.map(&:to_s)
    assert_equal inner_methods1, y.instance_methods(false).sort.map(&:to_s)
    assert_equal inner_methods2, z.instance_methods(false).sort.map(&:to_s)
  end

  def test_structure_postfix_it
    z = nil
    y = describe "outer" do
      # NOT here, below the inner-describe!
      # it "inner-it" do end

      z = describe "inner" do
        it "inner-it" do end
      end

      # defined AFTER inner describe means we'll try to wipe out the inner-it
      it "inner-it" do end
    end

    assert_equal %w[test_0001_inner-it], y.instance_methods(false).map(&:to_s)
    assert_equal %w[test_0001_inner-it], z.instance_methods(false).map(&:to_s)
  end

  def test_setup_teardown_behavior
    _, _, z, before_list, after_list = util_structure

    @tu = z

    run_tu_with_fresh_reporter

    size = z.runnable_methods.size
    assert_equal [1, 2, 3] * size, before_list
    assert_equal [3, 2, 1] * size, after_list
  end

  def test_describe_first_structure
    x1 = x2 = y = z = nil
    x = describe "top-level thingy" do
      y = describe "first thingy" do end

      x1 = it "top level it" do end
      x2 = it "не латинские &いった α, β, γ, δ, ε hello!!! world" do end

      z = describe "second thingy" do end
    end

    test_methods = ["test_0001_top level it",
                    "test_0002_не латинские &いった α, β, γ, δ, ε hello!!! world",
                   ].sort

    assert_equal test_methods, [x1, x2]
    assert_equal test_methods, x.instance_methods.grep(/^test/).map(&:to_s).sort
    assert_equal [], y.instance_methods.grep(/^test/)
    assert_equal [], z.instance_methods.grep(/^test/)
  end

  def test_structure_subclasses
    z = nil
    x = Class.new Minitest::Spec do
      def xyz; end
    end
    y = Class.new x do
      z = describe("inner") { }
    end

    assert_respond_to x.new(nil), "xyz"
    assert_respond_to y.new(nil), "xyz"
    assert_respond_to z.new(nil), "xyz"
  end
end

class TestSpecInTestCase < MetaMetaMetaTestCase
  def setup
    super

    Thread.current[:current_spec] = self
    @tc = self
    @assertion_count = 2
  end

  def assert_triggered expected, klass = Minitest::Assertion
    @assertion_count += 1

    e = assert_raises klass do
      yield
    end

    msg = e.message.sub(/(---Backtrace---).*/m, "\1")
    msg.gsub!(/\(oid=[-0-9]+\)/, "(oid=N)")

    assert_equal expected, msg
  end

  def teardown
    msg = "expected #{@assertion_count} assertions, not #{@tc.assertions}"
    assert_equal @assertion_count, @tc.assertions, msg
  end

  def test_expectation
    @tc.assert_equal true, 1.must_equal(1)
  end

  def test_expectation_triggered
    assert_triggered "Expected: 2\n  Actual: 1" do
      1.must_equal 2
    end
  end

  def test_expectation_with_a_message
    assert_triggered "woot.\nExpected: 2\n  Actual: 1" do
      1.must_equal 2, "woot"
    end
  end
end

class ValueMonadTest < Minitest::Test
  attr_accessor :struct

  def setup
    @struct = { :_ => "a", :value => "b", :expect => "c" }
    def @struct.method_missing k # think openstruct
      self[k]
    end
  end

  def test_value_monad_method
    assert_equal "a", struct._
  end

  def test_value_monad_value_alias
    assert_equal "b", struct.value
  end

  def test_value_monad_expect_alias
    assert_equal "c", struct.expect
  end
end

