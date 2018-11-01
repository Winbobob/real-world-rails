# frozen_string_literal: true

Capybara::SpecHelper.spec '#all' do
  before do
    @session.visit('/with_html')
  end

  it 'should find all elements using the given locator' 


  it 'should return an empty array when nothing was found' 


  it 'should wait for matching elements to appear', requires: [:js] do
    Capybara.default_max_wait_time = 2
    @session.visit('/with_js')
    @session.click_link('Click me')
    expect(@session.all(:css, 'a#has-been-clicked')).not_to be_empty
  end

  it 'should not wait if `minimum: 0` option is specified', requires: [:js] do
    @session.visit('/with_js')
    @session.click_link('Click me')
    expect(@session.all(:css, 'a#has-been-clicked', minimum: 0)).to be_empty
  end

  it 'should accept an XPath instance', :exact_false do
    @session.visit('/form')
    @xpath = Capybara::Selector.all[:fillable_field].call('Name')
    expect(@xpath).to be_a(::XPath::Union)
    @result = @session.all(@xpath).map(&:value)
    expect(@result).to include('Smith', 'John', 'John Smith')
  end

  it 'should raise an error when given invalid options' 


  context 'with css selectors' do
    it 'should find all elements using the given selector' 


    it 'should find all elements when given a list of selectors' 

  end

  context 'with xpath selectors' do
    it 'should find the first element using the given locator' 

  end

  context 'with css as default selector' do
    before { Capybara.default_selector = :css }

    it 'should find the first element using the given locator' 

  end

  context 'with visible filter' do
    it 'should only find visible nodes when true' 


    it 'should find nodes regardless of whether they are invisible when false' 


    it 'should default to Capybara.ignore_hidden_elements' 


    context 'with per session config', requires: [:psc] do
      it 'should use the sessions ignore_hidden_elements', psc: true do
        Capybara.ignore_hidden_elements = true
        @session.config.ignore_hidden_elements = false
        expect(Capybara.ignore_hidden_elements).to eq(true)
        expect(@session.all(:css, 'a.simple').size).to eq(2)
        @session.config.ignore_hidden_elements = true
        expect(@session.all(:css, 'a.simple').size).to eq(1)
      end
    end
  end

  context 'with element count filters' do
    context ':count' do
      it 'should succeed when the number of elements founds matches the expectation' 

      it 'should raise ExpectationNotMet when the number of elements founds does not match the expectation' 

    end

    context ':minimum' do
      it 'should succeed when the number of elements founds matches the expectation' 

      it 'should raise ExpectationNotMet when the number of elements founds does not match the expectation' 

    end

    context ':maximum' do
      it 'should succeed when the number of elements founds matches the expectation' 

      it 'should raise ExpectationNotMet when the number of elements founds does not match the expectation' 

    end

    context ':between' do
      it 'should succeed when the number of elements founds matches the expectation' 

      it 'should raise ExpectationNotMet when the number of elements founds does not match the expectation' 

    end

    context 'with multiple count filters' do
      it 'ignores other filters when :count is specified' 

      context 'with no :count expectation' do
        it 'fails if :minimum is not met' 

        it 'fails if :maximum is not met' 

        it 'fails if :between is not met' 

        it 'succeeds if all combineable expectations are met' 

      end
    end
  end

  context 'within a scope' do
    before do
      @session.visit('/with_scope')
    end

    it 'should find any element using the given locator' 

  end

  it 'should have #find_all as an alias' 

end
