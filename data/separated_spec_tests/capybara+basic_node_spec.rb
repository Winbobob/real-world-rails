# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Capybara do
  describe '.string' do
    let :string do
      Capybara.string <<-STRING
        <html>
          <head>
            <title>simple_node</title>
          </head>
          <body>
            <svg><title>not document title</title></svg>
            <div id="page">
              <div id="content">
                <h1 data="fantastic">Totally awesome</h1>
                <p>Yes it is</p>
              </div>

              <form>
                <input type="text" name="bleh" disabled="disabled"/>
                <input type="text" name="meh"/>
              </form>

              <div id="footer">
                <p>c2010</p>
                <p>Jonas Nicklas</p>
                <input type="text" name="foo" value="bar"/>
                <select name="animal">
                  <option>Monkey</option>
                  <option selected="selected">Capybara</option>
                </select>
              </div>

              <div id="hidden" style="display: none">
                <p id="secret">Secret</p>
              </div>

              <section>
                <div class="subsection"></div>
              </section>
            </div>
          </body>
        </html>
      STRING
    end

    it 'allows using matchers' 


    it 'allows using custom matchers' 


    it 'allows custom matcher using css' 


    it 'allows using matchers with text option' 


    it 'allows finding only visible nodes' 


    it 'allows finding elements and extracting text from them' 


    it 'allows finding elements and extracting attributes from them' 


    it 'allows finding elements and extracting the tag name from them' 


    it 'allows finding elements and extracting the path' 


    it 'allows finding elements and extracting the value' 


    it 'allows finding elements and checking if they are visible' 


    it 'allows finding elements and checking if they are disabled' 


    describe '#title' do
      it 'returns the page title' 

    end

    describe '#has_title?' do
      it 'returns whether the page has the given title' 


      it 'allows regexp matches' 

    end

    describe '#has_no_title?' do
      it 'returns whether the page does not have the given title' 


      it 'allows regexp matches' 

    end
  end
end

