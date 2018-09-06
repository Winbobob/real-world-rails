require 'rspec/matchers/fail_matchers'
require 'support/doubled_classes'

RSpec.describe "Test doubles format well in failure messages" do
  include RSpec::Matchers::FailMatchers

  RSpec::Matchers.define :format_in_failures_as do |expected|
    match do |dbl|
      values_match?(expected, actual_formatting(dbl))
    end

    def actual_formatting(double)
      expect(1).to eq(double)
    rescue RSpec::Expectations::ExpectationNotMetError => e
      e.message[/expected: (.*)$/, 1]
    else
      raise "Did not fail as expected"
    end
  end

  describe "`double`" do
    context "with a name" do
      specify '#<Double "Name">' do
        expect(double "Book").to format_in_failures_as('#<Double "Book">')
      end

      it 'formats the name as a symbol if that was how it was provided' 

    end

    context "without a name" do
      specify '#<Double (anonymous)>' do
        expect(double).to format_in_failures_as('#<Double (anonymous)>')
      end
    end

    it 'avoids sending `instance_variable_get` to the double as it may be stubbed' 

  end

  describe "`instance_double(SomeClass)`" do
    context "with a name" do
      specify '#<InstanceDouble(SomeClass) "Name">' do
        expect(instance_double(LoadedClass, "Book")).to format_in_failures_as('#<InstanceDouble(LoadedClass) "Book">')
      end
    end

    context "without a name" do
      specify '#<InstanceDouble(SomeClass) (anonymous)>' do
        expect(instance_double(LoadedClass)).to format_in_failures_as('#<InstanceDouble(LoadedClass) (anonymous)>')
      end
    end

    it 'avoids sending `instance_variable_get` to the double as it may be stubbed' 

  end

  describe "`class_double(SomeClass)`" do
    context "with a name" do
      specify '#<ClassDouble(SomeClass) "Name">' do
        expect(class_double(LoadedClass, "Book")).to format_in_failures_as('#<ClassDouble(LoadedClass) "Book">')
      end
    end

    context "without a name" do
      specify '#<ClassDouble(SomeClass) (anonymous)>' do
        expect(class_double(LoadedClass)).to format_in_failures_as('#<ClassDouble(LoadedClass) (anonymous)>')
      end
    end
  end

  describe "`object_double([])`" do
    context "with a name" do
      specify '#<ObjectDouble([]) "Name">' do
        expect(object_double([], "Name")).to format_in_failures_as('#<ObjectDouble([]) "Name">')
      end
    end

    context "without a name" do
      specify '#<ObjectDouble([]) (anonymous)>' do
        expect(object_double([])).to format_in_failures_as('#<ObjectDouble([]) (anonymous)>')
      end
    end
  end

  it 'formats the doubles when they appear in data structures and diffs' 

end

