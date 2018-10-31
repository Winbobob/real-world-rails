# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe AttachmentsController do
    routes { Alchemy::Engine.routes }

    let(:attachment) { build_stubbed(:alchemy_attachment) }

    it "should raise ActiveRecord::RecordNotFound for requesting not existing attachments" 


    context 'with public attachment' do
      before do
        allow(Attachment).to receive(:find).and_return(attachment)
      end

      it "sends download as attachment." 


      it "sends download inline." 


      context "adds Content-Length to header" do
        it "when downloading attachment" 


        it "when showing attachment" 

      end
    end

    context 'with restricted attachment' do
      before do
        allow(attachment).to receive(:restricted?).and_return(true)
        allow(Attachment).to receive(:find).and_return(attachment)
      end

      context 'as anonymous user' do
        it "should not be possible to download attachments from restricted pages" 


        it "should not be possible to see attachments from restricted pages" 

      end

      context "as member user" do
        before { authorize_user(build(:alchemy_dummy_user)) }

        it "should be possible to download attachments from restricted pages" 


        it "should be possible to see attachments from restricted pages" 

      end
    end
  end
end

