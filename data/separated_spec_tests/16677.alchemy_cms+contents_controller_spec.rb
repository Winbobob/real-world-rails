# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe Admin::ContentsController do
    before do
      authorize_user(:as_admin)
    end

    context 'with element_id parameter' do
      describe '#create' do
        let(:element) { create(:alchemy_element, name: 'headline') }

        it "creates a content from name" 


        it "creates a content from essence_type" 

      end
    end
  end
end

