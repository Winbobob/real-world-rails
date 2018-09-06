require 'spec_helper'

feature 'sitemap' do
  let(:enterprise) { create(:distributor_enterprise) }
  let!(:group) { create(:enterprise_group, enterprises: [enterprise], on_front_page: true) }

  it "renders sitemap" 

end

