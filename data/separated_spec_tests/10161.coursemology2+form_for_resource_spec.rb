# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Extension: form_for with resource', type: :view do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    it 'does not allow :url to be used with :resource' 


    it 'requires :resource to be a symbol' 


    it 'automatically adds the `path` suffix for route helpers' 


    context 'when the resource is new' do
      subject { form_for(build(:course), resource: :course_path) {} }
      it 'generates the plural route' 

    end

    context 'when the resource is persisted' do
      let(:course) { create(:course) }
      subject { form_for(course, resource: :course_path) {} }
      it 'generates the singular route' 

    end
  end
end

