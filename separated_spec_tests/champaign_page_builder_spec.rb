# frozen_string_literal: true
require 'rails_helper'

describe PageBuilder do
  let(:language) { create(:language) }
  let(:params) { { title: 'Foo Bar', liquid_layout_id: template.id, language_id: language.id } }
  let(:content) { "{% include 'petition' %}<div class='foo'>{% include 'thermometer' %}</div>" }
  let(:follow_up_template) { create :liquid_layout, default_follow_up_layout: nil }
  let(:template) { create :liquid_layout, content: content, default_follow_up_layout: follow_up_template }

  before :each do
    create :liquid_partial, title: 'petition', content: '{{ plugins.petition[ref].lol }}'
    create :liquid_partial, title: 'thermometer', content: '{{ plugins.thermometer[ref].lol }}'

    create(:liquid_layout, :default)
    allow(QueueManager).to receive(:push)
  end

  subject { PageBuilder.create(params) }

  it 'creates a campaign page' 


  it 'pushes page to queue' 


  it 'uses the correct liquid layout' 


  [Plugins::Thermometer, Plugins::Petition].each do |plugin|
    it "creates a #{plugin.name}" 

  end

  it 'sets follow up layout for a page created with a layout that has a default post-action layout' 


  it 'sets no follow up layout for a page created with a layout that has no default post-action layout' 


  it 'creates no page and throws no error for when there is an attempt to create a page without a liquid layout' 

end

