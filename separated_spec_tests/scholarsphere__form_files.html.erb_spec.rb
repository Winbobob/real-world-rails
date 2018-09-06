# frozen_string_literal: true

require 'rails_helper'

describe 'curation_concerns/base/_form_files.html.erb' do
  let(:user)      { create(:user) }
  let(:work)      { create(:work, depositor: user.login) }
  let(:ability)   { Ability.new(user) }
  let(:form)      { CurationConcerns::GenericWorkForm.new(work, ability) }
  let(:page)      { Capybara::Node::Simple.new(rendered) }
  let(:all_label) { page.find('button.all')['aria-label'] }

  before do
    view.simple_form_for form do |f|
      render 'curation_concerns/base/form_files.html.erb', f: f
    end
  end

  it 'displays informative and accessible elements' 


  describe 'BrowseEverything button selector' do
    subject { page.find('#browse-btn')['data-target'] }

    context '#edit' do
      it { is_expected.to eq("#edit_generic_work_#{work.id}") }
    end

    context '#new' do
      let(:work) { build(:work, depositor: user.login) }

      it { is_expected.to eq('#new_generic_work') }
    end
  end
end

