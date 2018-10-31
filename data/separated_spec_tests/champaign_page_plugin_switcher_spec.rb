# frozen_string_literal: true
require 'rails_helper'

describe PagePluginSwitcher do
  let!(:petition_partial) { create :liquid_partial, title: 'petition', content: '{{ plugins.petition[ref] }}' }
  let!(:thermo_partial) { create :liquid_partial, title: 'thermo', content: '{{ plugins.thermometer[ref] }}' }
  let!(:petition_nested_thermo_partial) do
    create :liquid_partial, title: 'petition_nested_thermo', content: '{{ plugins.petition[ref] }}{% include "thermo" %}'
  end

  let(:blank_layout) { create :liquid_layout, title: 'blank', content: '<h1>yoooo</h1>' }
  let(:both_refless_layout) { create :liquid_layout, title: 'both_refless', content: '{% include "petition" %} {% include "thermo" %}' }
  let(:petition_ref_layout) { create :liquid_layout, title: 'petition_ref', content: '{% include "petition", ref: "modal" %} ' }
  let(:thermo_petition_ref_layout) { create :liquid_layout, title: 'petition_ref', content: '{% include "petition", ref: "modal" %} {% include "thermo" %}' }
  let(:many_petition_layout) { create :liquid_layout, title: 'many_petition', content: '{% include "petition", ref: "a" %} {% include "petition", ref: "b" %} {% include "petition" %}' }
  let(:nested_refless_layout) { create :liquid_layout, title: 'nested_refless', content: '{% include "petition_nested_thermo" %}' }

  let!(:page) { create :page, liquid_layout: both_refless_layout }
  let!(:switcher) { PagePluginSwitcher.new(page) }

  describe '.switch' do
    describe 'creating' do
      it 'creates missing plugins when using the same template' 


      it 'creates new plugins when switching to a template with more plugins' 


      it 'creates with a ref if present' 


      it 'creates without a ref if not present' 


      it 'can create a version of a plugin for each layout' 


      it 'can share a plugin between the two layouts' 

    end

    describe 'replacing' do
      it 'does not replace instances if new template has same plugins' 


      it 'does not replace instances if new template is old template' 


      it 'does replace instances if refs are different' 


      it 'does replace one instance but not the other' 

    end

    describe 'destroying' do
      it 'destroys all plugins when switching to a template without plugins' 

    end

    it 'should not save the page itself' 

  end
end

