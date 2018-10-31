require 'rails_helper'
include Webui::WebuiHelper

RSpec.describe Webui::SearchHelper, type: :helper do
  describe '#search_owners_list' do
    let(:user) { create(:user) }
    let(:maintainer) { create_list(:user, 3).map(&:login) }
    let(:foo_user) { create_list(:user, 2).map(&:login) }
    let(:list) { { maintainer: maintainer, foo: foo_user } }

    it 'returns an empty list when first parameter is empty' 


    it 'creates an icon with link for each user' 


    context "when second parameter is ':group'" do
      it 'creates a label for each user that contains user name and role' 

    end
  end
end

