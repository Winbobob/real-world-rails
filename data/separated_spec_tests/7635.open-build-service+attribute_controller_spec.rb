require 'rails_helper'

RSpec.describe AttributeController, type: :controller do
  render_views

  describe '#update' do
    let(:admin) { create(:admin_user) }
    let(:user) { create(:confirmed_user) }
    let(:attribute) { build(:attrib_type) }
    let(:namespace) { attribute.namespace }
    let(:name) { attribute.name }

    let(:xml_count_2) do
      "<definition namespace='#{namespace}' name='#{name}'>
        <count>2</count>
        <modifiable_by user='#{user.login}'/>
      </definition>"
    end

    it 'will create attribute on POST' 


    it 'will update on POST' 

  end
end

