require 'rails_helper'

RSpec.describe "offices/index", type: :view do
  subject { rendered }

  let(:offices) { create_list(:office, 2) }

  let(:office_new?) { false }

  before do
    assign(:offices, offices)
    allow(view).to receive(:policy).with(:office).and_return(instance_double(OfficePolicy, new?: office_new?))
    allow(view).to receive(:policy).with(offices[0]).and_return(instance_double(OfficePolicy, edit?: true))
    allow(view).to receive(:policy).with(offices[1]).and_return(instance_double(OfficePolicy, edit?: false))

    render
  end

  describe 'Link to change office details' do
    context 'when user has permission to change the office\'s details' do
      it 'is rendered' 

    end

    context 'when user does not have permission to chang the office\'s details' do
      it 'is not rendered' 

    end
  end

  describe 'The link to create office' do
    context 'when user has permission to create new office' do
      let(:office_new?) { true }

      it 'is rendered' 

    end

    context 'when user does not have permission to create new office' do
      it 'is not rendered' 

    end
  end
end

