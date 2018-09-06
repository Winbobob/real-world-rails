require 'rails_helper'

describe PhotosController, type: :controller do
  include_context 'signed in admin'

  let(:dog) { create(:dog_with_photo_and_attachment) }
  let(:photo) { create(:photo, dog: dog) }

  describe 'POST #sort' do
    it 'is successful' 

  end
end

