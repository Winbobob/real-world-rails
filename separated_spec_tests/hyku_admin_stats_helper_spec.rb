RSpec.describe AdminStatsHelper do
  describe "#graph_tag" do
    let(:data) { [{ "label" => "foo", "data" => 7 }] }
    subject { helper.graph_tag('work', data, {}) }

    let(:node) { Capybara::Node::Simple.new(subject) }

    it 'draws html' 

  end
end

