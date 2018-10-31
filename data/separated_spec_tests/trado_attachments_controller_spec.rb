require 'rails_helper'

describe Admin::AttachmentsController do

    store_setting
    login_admin

    describe 'DELETE #destroy' do
        let!(:product) { create(:product) }
        let!(:attachment) { create(:product_attachment, attachable: product) }

        it "should assign the requested attachment to @attachment" 


        context "if the parent item attachment count is more than one" do

            it "should destroy the attachment" 

        end
    end
end

