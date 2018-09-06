require 'rails_helper'

describe AdoptionAppController, type: :controller do
  describe 'PUT update' do
    include_context 'signed in admin'

    let(:adopter) { create(:adopter_with_app) }
    let(:adoption_app) { adopter.adoption_app }

    it 'is successful' 

  end
end

