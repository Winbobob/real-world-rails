# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Capybara do
  describe 'Selectors' do
    let :string do
      Capybara.string <<-STRING
        <html>
          <head>
            <title>selectors</title>
          </head>
          <body>
            <div class="aa" id="page">
              <div class="bb" id="content">
                <h1 class="aa">Totally awesome</h1>
                <p>Yes it is</p>
              </div>
              <p class="bb cc">Some Content</p>
              <p class="bb dd !mine"></p>
            </div>
            <div id="#special">
            </div>
            <div class="some random words" id="random_words">
              Something
            </div>
            <input id="2checkbox" class="2checkbox" type="checkbox"/>
            <input type="radio"/>
            <label for="my_text_input">My Text Input</label>
            <input type="text" name="form[my_text_input]" placeholder="my text" id="my_text_input"/>
            <input type="file" id="file" class=".special file"/>
            <input type="hidden" id="hidden_field" value="this is hidden"/>
            <input type="submit" value="click me" title="submit button"/>
            <input type="button" value="don't click me" title="Other button 1"/>
            <a href="#">link</a>
            <fieldset></fieldset>
            <select id="select">
              <option value="a">A</option>
              <option value="b" disabled>B</option>
              <option value="c" selected>C</option>
            </select>
            <table>
              <tr><td></td></tr>
            </table>
          </body>
        </html>
      STRING
    end

    before do
      Capybara.add_selector :custom_selector do
        css { |css_class| "div.#{css_class}" }
        node_filter(:not_empty, boolean: true, default: true, skip_if: :all) { |node, value| value ^ (node.text == '') }
      end

      Capybara.add_selector :custom_css_selector do
        css(:name, :other_name) do |selector, name: nil, **|
          selector ||= ''
          selector += "[name='#{name}']" if name
          selector
        end

        expression_filter(:placeholder) do |expr, val|
          expr + "[placeholder='#{val}']"
        end

        expression_filter(:value) do |expr, val|
          expr + "[value='#{val}']"
        end

        expression_filter(:title) do |expr, val|
          expr + "[title='#{val}']"
        end
      end

      Capybara.add_selector :custom_xpath_selector do
        xpath(:valid1, :valid2) { |selector| selector }
      end
    end

    it 'supports `filter` as an alias for `node_filter`' 


    describe 'adding a selector' do
      it 'can set default visiblity' 

    end

    describe 'modify_selector' do
      it 'allows modifying a selector' 


      it "doesn't change existing filters" 

    end

    describe 'xpath' do
      it 'uses filter names passed in' 


      it 'gets filter names from block if none passed to xpath method' 


      it 'ignores block parameters if names passed in' 

    end

    describe 'css' do
      it "supports filters specified in 'css' definition" 


      it 'supports explicitly defined expression filters' 


      it 'uses filter names passed in' 


      it 'gets filter names from block if none passed to css method' 


      it 'ignores block parameters if names passed in' 

    end

    describe 'builtin selectors' do
      context 'when locator is nil' do
        it 'devolves to just finding element types' 

      end

      context 'with :id option' do
        it 'works with compound css selectors' 


        it "works with 'special' characters" 


        it 'accepts XPath expression for xpath based selectors' 


        it 'errors XPath expression for CSS based selectors' 


        it 'accepts Regexp for xpath based selectors' 


        it 'accepts Regexp for css based selectors' 

      end

      context 'with :class option' do
        it 'works with compound css selectors' 


        it 'handles negated classes' 


        it 'handles classes starting with ! by requiring negated negated first' 


        it "works with 'special' characters" 


        it 'accepts XPath expression for xpath based selectors' 


        it 'errors XPath expression for CSS based selectors' 


        it 'accepts Regexp for XPath based selectors' 


        it 'accepts Regexp for CSS base selectors' 

      end

      # :css, :xpath, :id, :field, :fieldset, :link, :button, :link_or_button, :fillable_field, :radio_button, :checkbox, :select,
      # :option, :file_field, :label, :table, :frame

      describe ':css selector' do
        it 'finds by CSS locator' 

      end

      describe ':xpath selector' do
        it 'finds by XPath locator' 

      end

      describe ':id selector' do
        it 'finds by locator' 

      end

      describe ':field selector' do
        it 'finds by locator' 


        it 'finds by id string' 


        it 'finds by id regexp' 


        it 'finds by name' 


        it 'finds by placeholder' 


        it 'finds by type' 

      end

      describe ':option selector' do
        it 'finds disabled options' 


        it 'finds selected options' 


        it 'finds not selected and not disabled options' 

      end

      describe ':button selector' do
        it 'finds by value' 


        it 'finds by title' 


        it 'includes non-matching parameters in failure message' 

      end

      describe ':element selector' do
        it 'finds by any attributes' 


        it 'supports regexp matching' 


        it 'still works with system keys' 


        it 'works without element type' 


        it 'validates attribute presence when true' 


        it 'validates attribute absence when false' 


        it 'includes wildcarded keys in description' 


        it 'accepts XPath::Expression' 

      end
    end
  end
end

