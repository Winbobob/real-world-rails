require 'rails_helper'

RSpec.describe PdfsController, type: :controller do
  include CarrierWaveHelper
  describe 'show' do
    around do |example|
      using_carrierwave_storage(:fog) do
        example.run
      end
    end

    before do
      session[:claim_reference] = claim.reference
      get :show
    end

    context 'pdf is available' do
      let(:claim) { create :claim, :with_pdf }

      it 'redirects to an amazon s3 url with a 10 minute expiry' 

    end

    context 'pdf is unavailable' do
      ['payment_required', 'submitted', 'enqueued_for_submission'].each do |state|
        context "claim is in a '#{state}' state" do
          let(:claim) { create :claim, state: state }

          it 'sends the user to the pdf holding page' 

        end
      end

      context 'claim is in a state not able to generate a pdf' do
        let(:claim) { create :claim, state: 'created' }

        it 'redirects the user to the relevant position in the form process' 

      end
    end
  end

  def url_path_part
    ["https://",
     "#{ENV.fetch('S3_UPLOAD_BUCKET')}.s3-eu-west-1.amazonaws.com/",
     "uploads/claim/pdf/",
     "#{claim.reference}/",
     "et1_barrington_wrigglesworth.pdf",
     "?X-Amz-Expires=600"].join
  end
end

