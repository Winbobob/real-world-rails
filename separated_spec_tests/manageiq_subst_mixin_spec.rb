RSpec.describe MiqExpression::SubstMixin do
  let(:test_class) { Class.new { include MiqExpression::SubstMixin } }
  let(:test_obj) { test_class.new }

  describe "#exp_replace_qs_tokens" do
    it "removes :token key from passed expression" 

  end
end

