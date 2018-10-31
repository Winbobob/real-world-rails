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
            <div class="a" id="page">
              <div class="b" id="content">
                <h1 class="a">Totally awesome</h1>
                <p>Yes it is</p>
              </div>
              <p class="b">Some Content</p>
              <p class="b"></p>
            </div>
            <div id="#special">
            </div>
            <input id="2checkbox" class="2checkbox" type="checkbox"/>
            <input type="radio"/>
            <label for="my_text_input">My Text Input</label>
            <input type="text" name="form[my_text_input]" placeholder="my text" id="my_text_input"/>
            <input type="file" id="file" class=".special file"/>
            <input type="hidden" id="hidden_field" value="this is hidden"/>
            <input type="submit" value="click me" title="submit button"/>
            <a href="#">link</a>
            <fieldset></fieldset>
            <select id="select">
              <option value="a">A</option>
              <option value="b" disabled>B</option>
              <option value="c" selected>C</option>
            </select>
            <table>
              <tr><td></td></tr>
            </table
          </body>
        </html>
      STRING
    end

    before do
      Capybara.add_selector :custom_selector do
        css { |css_class| "div.#{css_class}" }
        filter(:not_empty, boolean: true, default: true, skip_if: :all) { |node, value| value ^ (node.text == '') }
      end

      Capybara.add_selector :custom_css_selector do
        css { |selector| selector }
      end
    end

    describe "adding a selector" do
      it "can set default visiblity" 

    end

    describe "modify_selector" do
      it "allows modifying a selector" 


      it "doesn't change existing filters" 

    end

    describe "builtin selectors" do
      context "when locator is nil" do
        it "devolves to just finding element types" 

      end

      context "with :id option" do
        it "works with compound css selectors" 


        it "works with 'special' characters" 

      end

      context "with :class option" do
        it "works with compound css selectors" 


        it "works with 'special' characters" 

      end

      # :css, :xpath, :id, :field, :fieldset, :link, :button, :link_or_button, :fillable_field, :radio_button, :checkbox, :select,
      # :option, :file_field, :label, :table, :frame

      describe ":css selector" do
        it "finds by CSS locator" 

      end

      describe ":xpath selector" do
        it "finds by XPath locator" 

      end

      describe ":id selector" do
        it "finds by locator" 

      end

      describe ":field selector" do
        it "finds by locator" 


        it "finds by id" 


        it "finds by name" 


        it "finds by placeholder" 


        it "finds by type" 

      end

      describe ":option selector" do
        it "finds disabled options" 


        it "finds selected options" 


        it "finds not selected and not disabled options" 

      end

      describe ":button selector" do
        it "finds by value" 


        it "finds by title" 


        it "includes non-matching parameters in failure message" 

      end
    end
  end
end

