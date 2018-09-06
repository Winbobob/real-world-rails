# frozen_string_literal: true

Capybara::SpecHelper.spec '#find' do
  before do
    @session.visit('/with_html')
  end

  after do
    Capybara::Selector.remove(:monkey)
  end

  it "should find the first element using the given locator" 


  it "should find the first element using the given locator and options" 


  it "should raise an error if there are multiple matches" 


  it "should wait for asynchronous load", requires: [:js] do
    @session.visit('/with_js')
    @session.click_link('Click me')
    expect(@session.find(:css, "a#has-been-clicked").text).to include('Has been clicked')
  end

  context "with :text option" do
    it "casts text's argument to string" 

  end

  context "with :wait option", requires: [:js] do
    it "should not wait for asynchronous load when `false` given" 


    it "should not find element if it appears after given wait duration" 


    it "should find element if it appears before given wait duration" 

  end

  context "with frozen time", requires: [:js] do
    if defined?(Process::CLOCK_MONOTONIC)
      it "will time out even if time is frozen" 

    else
      it "raises an error suggesting that Capybara is stuck in time" 

    end
  end

  context "with css selectors" do
    it "should find the first element using the given locator" 


    it "should support pseudo selectors" 


    it "should support escaping characters" 

  end

  context "with xpath selectors" do
    it "should find the first element using the given locator" 

  end

  context "with custom selector" do
    it "should use the custom selector" 

  end

  context "with custom selector with custom `match` block" do
    it "should use the custom selector when locator matches the block" 

  end

  context "with custom selector with custom filter" do
    before do
      Capybara.add_selector(:beatle) do
        xpath { |name| ".//li[contains(@class, 'beatle')][contains(text(), '#{name}')]" }
        filter(:type) { |node, type| node[:class].split(/\s+/).include?(type) }
      end
    end

    it "should find elements that match the filter" 


    it "ignores filter when it is not given" 


    it "should not find elements that don't match the filter" 

  end

  context "with custom selector with custom filter and default" do
    before do
      Capybara.add_selector(:beatle) do
        xpath { |name| ".//li[contains(@class, 'beatle')][contains(text(), '#{name}')]" }
        filter(:type, default: "drummer") { |node, type| node[:class].split(/\s+/).include?(type) }
      end
    end

    it "should find elements that match the filter" 


    it "should use default value when filter is not given" 


    it "should not find elements that don't match the filter" 

  end

  context "with alternate filter set" do
    before do
      Capybara::Selector::FilterSet.add(:value) do
        filter(:with) { |node, with| node.value == with.to_s }
      end

      Capybara.add_selector(:id_with_field_filters) do
        xpath { |id| XPath.descendant[XPath.attr(:id) == id.to_s] }
        filter_set(:field)
      end
    end

    it "should allow use of filters from custom filter set" 


    it "should allow use of filter set from a different selector" 


    it "should allow importing of filter set into selector" 

  end

  context "with css as default selector" do
    before { Capybara.default_selector = :css }
    it "should find the first element using the given locator" 

    after { Capybara.default_selector = :xpath }
  end

  it "should raise ElementNotFound with a useful default message if nothing was found" 


  it "should accept an XPath instance" 


  context "with :exact option" do
    it "matches exactly when true" 


    it "matches loosely when false" 


    it "defaults to `Capybara.exact`" 


    it "warns when the option has no effect" 

  end

  context "with :match option" do
    context "when set to `one`" do
      it "raises an error when multiple matches exist" 

      it "raises an error even if there the match is exact and the others are inexact" 

      it "returns the element if there is only one" 

      it "raises an error if there is no match" 

    end

    context "when set to `first`" do
      it "returns the first matched element" 

      it "raises an error if there is no match" 

    end

    context "when set to `smart`" do
      context "and `exact` set to `false`" do
        it "raises an error when there are multiple exact matches" 

        it "finds a single exact match when there also are inexact matches" 

        it "raises an error when there are multiple inexact matches" 

        it "finds a single inexact match" 

        it "raises an error if there is no match" 

      end

      context "with `exact` set to `true`" do
        it "raises an error when there are multiple exact matches" 

        it "finds a single exact match when there also are inexact matches" 

        it "raises an error when there are multiple inexact matches" 

        it "raises an error when there is a single inexact matches" 

        it "raises an error if there is no match" 

      end
    end

    context "when set to `prefer_exact`" do
      context "and `exact` set to `false`" do
        it "picks the first one when there are multiple exact matches" 

        it "finds a single exact match when there also are inexact matches" 

        it "picks the first one when there are multiple inexact matches" 

        it "finds a single inexact match" 

        it "raises an error if there is no match" 

      end

      context "with `exact` set to `true`" do
        it "picks the first one when there are multiple exact matches" 

        it "finds a single exact match when there also are inexact matches" 

        it "raises an error if there are multiple inexact matches" 

        it "raises an error if there is a single inexact match" 

        it "raises an error if there is no match" 

      end
    end

    it "defaults to `Capybara.match`" 


    it "raises an error when unknown option given" 

  end

  it "supports a custom filter block" 


  context "within a scope" do
    before do
      @session.visit('/with_scope')
    end

    it "should find the an element using the given locator" 


    it "should support pseudo selectors" 

  end

  it "should raise if selector type is unknown" 

end

