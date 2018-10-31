require 'rails_helper'

RSpec.describe "offices/show", type: :view do
  subject { rendered }

  let(:office_name) { 'My office' }
  let(:jurisdictions) { build_stubbed_list(:jurisdiction, 2) }
  let!(:office) { assign(:office, build_stubbed(:office, name: office_name, jurisdictions: jurisdictions)) }
  let(:user) { create(:user) }

  let(:office_edit?) { false }
  let(:office_index?) { false }
  let(:business_entity_index?) { false }

  before do
    allow(view).to receive(:policy).with(office).and_return(instance_double(OfficePolicy, edit?: office_edit?))
    allow(view).to receive(:policy).with(:office).and_return(instance_double(OfficePolicy, index?: office_index?))
    allow(view).to receive(:policy).with(:business_entity).and_return(instance_double(OfficePolicy, index?: business_entity_index?))

    sign_in user
    render
  end

  it 'renders the office name' 


  it 'renders the office jurisdictions' 


  describe 'Change details link' do
    context 'when the user can edit the office' do
      let(:office_edit?) { true }

      it 'is rendered' 

    end

    context 'when the user can not edit the office' do
      it 'is not rendered' 

    end
  end

  describe 'Edit business entities link' do
    context 'when the user can list business entities' do
      let(:business_entity_index?) { true }

      it 'is rendered' 

    end

    context 'when the user can not list business entities' do
      it 'is not rendered' 

    end
  end

  describe 'Back to list of offices link' do
    context 'when the user can list offices' do
      let(:office_index?) { true }

      it 'is rendered' 

    end

    context 'when the user can not list offices' do
      it 'is not rendered' 

    end
  end
end

