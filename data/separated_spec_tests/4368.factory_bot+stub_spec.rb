shared_examples "disabled persistence method" do |method_name|
  let(:instance) { described_class.new.result(evaluation) }

  describe "overriding persistence method: ##{method_name}" do
    it "overrides the method with any arity" 


    it "raises an informative error if the method is called" 

  end
end

describe FactoryBot::Strategy::Stub do
  it_should_behave_like "strategy with association support", :build_stubbed
  it_should_behave_like "strategy with callbacks", :after_stub
  it_should_behave_like "strategy with strategy: :build", :build_stubbed

  context "asking for a result" do
    before { Timecop.freeze(Time.now) }
    let(:result_instance) do
      define_class("ResultInstance") do
        attr_accessor :id, :created_at
      end.new
    end

    let(:evaluation) do
      double("evaluation", object: result_instance, notify: true)
    end

    it { expect(subject.result(evaluation)).not_to be_new_record }
    it { expect(subject.result(evaluation)).to be_persisted }
    it { expect(subject.result(evaluation)).not_to be_destroyed }

    it "assigns created_at" 


    include_examples "disabled persistence method", :connection
    include_examples "disabled persistence method", :decrement!
    include_examples "disabled persistence method", :delete
    include_examples "disabled persistence method", :destroy
    include_examples "disabled persistence method", :destroy!
    include_examples "disabled persistence method", :increment!
    include_examples "disabled persistence method", :reload
    include_examples "disabled persistence method", :save
    include_examples "disabled persistence method", :save!
    include_examples "disabled persistence method", :toggle!
    include_examples "disabled persistence method", :touch
    include_examples "disabled persistence method", :update
    include_examples "disabled persistence method", :update!
    include_examples "disabled persistence method", :update_attribute
    include_examples "disabled persistence method", :update_attributes
    include_examples "disabled persistence method", :update_attributes!
    include_examples "disabled persistence method", :update_column
    include_examples "disabled persistence method", :update_columns
  end
end

