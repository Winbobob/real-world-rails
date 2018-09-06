# frozen_string_literal: true
require 'rails_helper'

# are these tests failing? it could be a breaking change in the liquid API.
# change to version 3.0.x and try again.
describe LiquidTagFinder do
  let(:base_content) do
    %(<section class="wrapper">
        <div class="foo">
          {% include "example" %}
        </div>
        <h2>{{ title }}</h2>
        <div class='bar'>
          {% include 'swell' %}
        </div>
      </section>
      <div>{% for field in plugins.petition.fields %}<p>hey</p>{% endfor %}</div>)
  end

  describe 'plugin_names' do
    after :each do
      actual = LiquidTagFinder.new(@content).plugin_names
      expect(actual).to match_array @expected
    end

    it 'finds a plugin in a basic variable tag' 


    it 'finds a plugin in a for loop tag' 


    it 'finds a plugin with underscores, numbers, and capital letters in the name' 


    it 'finds a plugin in a for loop tag' 


    it 'finds a plugin referenced twice in the same way' 


    it 'finds a plugin nested in a ref to the same plugin' 


    it 'finds a plugin nested in a ref to the same plugin' 


    it 'finds plugin nested deeply' 

  end

  describe 'partial_names' do
    after :each do
      actual = LiquidTagFinder.new(@content).partial_names
      expect(actual).to eq @expected
    end

    it 'finds a single include tag that uses single quotes' 


    it 'finds a single include tag that uses double quotes' 


    it 'finds a single include tag that passes a parameter' 


    it 'finds two tags without matching a variable' 

  end

  describe 'partial_refs' do
    let(:nested_top) do
      %( {% for field in plugins.Nd_0.fields %}
            {% if plugins.Nd_0.is_chill %}
              <h2>{{ plugins.chill.title }}</h2>
            {% else %}
              {% unless field == 'derp' %}
                {{ plugins.Nd_1 }} )
    end
    let(:nested_bottom) do
      %(     {% endunless %}
            {% endif %}
          {% endfor %} )
    end
    let(:surrounding) { { simple: ['', ''], nested: [nested_top, nested_bottom] } }

    [:simple, :nested].each do |nesting|
      describe "with a #{nesting} partial" do
        after :each do
          liquid_markup = "#{surrounding[nesting][0]}#{@content}#{surrounding[nesting][1]}"
          actual = LiquidTagFinder.new(liquid_markup).partial_refs
          expect(actual).to match_array @expected
        end

        it 'finds a single tag with no ref' 


        it 'finds a single tag with a ref' 


        it 'finds a single tag with another parameter and a ref' 


        it 'finds two of the same includes with different refs' 


        it 'finds two of the same includes with one ref' 


        it 'condenses two same includes with same ref' 


        it 'condenses two same includes with no refs' 


        it 'finds two different includes with no refs' 


        it 'finds two different includes with different refs' 


        it 'finds two different includes with same refs' 

      end
    end
  end

  describe 'description' do
    describe 'is found if it' do
      it 'has description in all lower case' 


      it 'has description in wonky case' 


      it 'has the description tag at the end' 


      it 'has the description tag in the middle' 


      it 'is the first description tag' 


      it 'comes after an experimental tag' 

    end

    describe 'is not found if it' do
      it 'does not have a colon' 


      it 'is not in a liquid comment' 


      it 'is not included' 

    end
  end

  describe 'experimental?' do
    it 'returns true if experimental is "true"' 


    it 'returns true if experimental is "TRUE"' 


    it 'returns false if experimental is 1' 


    it 'returns false if experimental tag is absent' 

  end

  describe 'primary_layout?' do
    it 'returns true if primary layout is "true"' 


    it 'returns false if primary_layout tag is absent' 

  end

  describe 'post_action_layout?' do
    it 'returns true if post-action layout is "true"' 


    it 'returns false if post_action_layout tag is absent' 

  end
end

