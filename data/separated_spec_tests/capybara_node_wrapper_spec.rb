# frozen_string_literal: true

class NodeWrapper
  def initialize(element); @element = element end
  def to_capybara_node(); @element end
end

Capybara::SpecHelper.spec "#to_capybara_node" do
  before do
    @session.visit('/with_html')
  end

  it "should support have_xxx expectations" 


  it "should support within" 


  it "should generate correct errors" 

end

