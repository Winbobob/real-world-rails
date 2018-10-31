RSpec.describe "exist matcher" do
  it_behaves_like "an RSpec matcher", :valid_value => Class.new { def exist?; true; end }.new,
                                      :invalid_value => Class.new { def exist?; false; end }.new do
    let(:matcher) { exist }
  end

  context "when the object does not respond to #exist? or #exists?" do
    subject { double }

    [:to, :not_to].each do |expect_method|
      describe "expect(...).#{expect_method} exist" do
        it "fails" 

      end
    end
  end

  it 'composes gracefully' 


  [:exist?, :exists?].each do |predicate|
    context "when the object responds to ##{predicate}" do
      describe "expect(...).to exist" do
        it "passes if #{predicate}" 


        it "fails if not #{predicate}" 


        it 'works when the object overrides `send`' 

      end

      describe "expect(...).not_to exist" do
        it "passes if not #{predicate}" 


        it "fails if #{predicate}" 

      end
    end
  end

  context "when the object responds to #exist? and #exists?" do
    context "when they both return falsey values" do
      subject { double(:exist? => false, :exists? => nil) }

      describe "expect(...).not_to exist" do
        it "passes" 

      end

      describe "expect(...).to exist" do
        it "fails" 

      end
    end

    context "when they both return truthy values" do
      subject { double(:exist? => true, :exists? => "something true") }

      describe "expect(...).not_to exist" do
        it "fails" 

      end

      describe "expect(...).to exist" do
        it "passes" 

      end
    end

    context "when they return values with different truthiness" do
      subject { double(:exist? => true, :exists? => false) }

      [:to, :not_to].each do |expect_method|
        describe "expect(...).#{expect_method} exist" do
          it "fails" 

        end
      end
    end

    context "when one predicate is deprecated" do
      context 'File has deprecated exists?' do
        it 'will not call exists? triggering the warning' 

      end
    end
  end

  it 'passes any provided arguments to the call to #exist?' 


  it 'memoizes the call to `exist?` because it can be expensive (such as doing a DB query)' 

end

