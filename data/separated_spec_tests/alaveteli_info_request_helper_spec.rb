# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InfoRequestHelper do

  include InfoRequestHelper

  describe '#status_text' do
    let(:info_request) { FactoryGirl.create(:info_request) }

    it 'requires an info_request argument' 


    it 'delegates the info_request argument for a valid status' 


    it 'delegates the options for a valid status' 


    it 'delegates to the custom partial for an unknown status' 


    context 'waiting_response' do

      it 'returns a description' 


    end

    context 'waiting_response_overdue' do

      it 'returns a description' 


    end


    context 'waiting_response_very_overdue' do

      it 'returns a description for an internal request' 


      it 'does not add a followup link for external requests' 


    end

    context 'not_held' do

      it 'returns a description' 


    end

    context 'rejected' do

      it 'returns a description' 


    end

    context 'successful' do

      it 'returns a description' 


    end

    context 'partially_successful' do

      it 'returns a description' 


    end

    context 'waiting_clarification' do

      before do
        allow(info_request).to receive(:calculate_status).and_return("waiting_clarification")
      end

      it 'returns a description for the request owner' 


      it 'returns a description for internal requests' 


      it 'does not add a followup link for external requests' 


      it 'requires an is_owning_user option' 


      it 'requires a redirect_to option' 


    end

    context 'gone_postal' do

      it 'returns a description' 


    end

    context 'internal_review' do

      it 'returns a description' 


    end

    context 'error_message' do

      it 'returns a description' 


    end

    context 'requires_admin' do

      it 'returns a description' 


    end

    context 'user_withdrawn' do

      it 'returns a description' 


    end

    context 'attention_requested' do

      it 'returns a description' 


    end

    context 'vexatious' do

      it 'returns a description' 


    end

    context 'not_foi' do

      it 'returns a description' 


    end

    context 'awaiting_description' do
      before do
        allow(info_request).to receive(:awaiting_description).and_return(true)
      end

      shared_examples_for "when we can't ask the user to update the status" do
        context "when there's one new reponse" do
          it 'asks the user to answer the question' 

        end

        context "when there's more than one new response" do
          it 'asks the user to answer the question' 

        end
      end

      context 'owning user' do
        context "when there's one new reponse" do
          it 'asks the user to answer the question' 

        end

        context "when there's more than one new response" do
          it 'asks the user to answer the question' 

        end
      end

      context 'old, unclassified request' do
        context "when there's one new reponse" do
          it 'asks the user to answer the question' 

        end

        context "when there's more than one new response" do
          it 'asks the user to answer the question' 

        end
      end

      context 'external request' do
        it_behaves_like "when we can't ask the user to update the status" do
          let(:info_request) { FactoryGirl.create(:external_request, awaiting_description: true) }
          let(:message) do
            status_text(info_request,
                        :new_responses_count => 1,
                        :is_owning_user => true,
                        :render_to_file => false,
                        :old_unclassified => false)
          end
          let(:plural_message) do
            status_text(info_request,
                        :new_responses_count => 3,
                        :is_owning_user => true,
                        :render_to_file => false,
                        :old_unclassified => false)
          end
        end
      end

      context 'rendering to a file' do
        it_behaves_like "when we can't ask the user to update the status" do
          let(:message) do
            status_text(info_request,
                        :new_responses_count => 1,
                        :is_owning_user => true,
                        :render_to_file => true,
                        :old_unclassified => false)
          end
          let(:plural_message) do
            status_text(info_request,
                        :new_responses_count => 3,
                        :is_owning_user => true,
                        :render_to_file => true,
                        :old_unclassified => false)
          end
        end
      end

      context 'non-owner viewing a recent request' do
        it_behaves_like "when we can't ask the user to update the status" do
          let(:message) do
            status_text(info_request,
                        :new_responses_count => 1,
                        :is_owning_user => false,
                        :render_to_file => false,
                        :old_unclassified => false)
          end
          let(:plural_message) do
            status_text(info_request,
                        :new_responses_count => 3,
                        :is_owning_user => false,
                        :render_to_file => false,
                        :old_unclassified => false)
          end

        end

      end

    end

  end

  describe '#attachment_link' do
    let(:incoming_message){ FactoryGirl.create(:incoming_message) }

    context 'if an icon exists for the filetype' do
      let(:jpeg_attachment){ FactoryGirl.create(:jpeg_attachment,
                              :incoming_message => incoming_message,
                              :url_part_number => 1)
                           }

      it 'returns a link with a specific icon' 


    end

    context 'if no icon exists for the filetype' do
      let(:unknown_attachment){ FactoryGirl.create(:unknown_attachment,
                                  :incoming_message => incoming_message,
                                  :url_part_number => 1)
                              }

      it 'returns a link with the "unknown" icon' 

    end

  end

  describe '#attachment_path' do
    let(:incoming_message){ FactoryGirl.create(:incoming_message) }
    let(:jpeg_attachment){ FactoryGirl.create(:jpeg_attachment,
                             :incoming_message => incoming_message,
                             :url_part_number => 1)
                         }

    context 'when given no format options' do

      it 'returns the path to the attachment with a cookie cookie_passthrough
          param' do

        expect(attachment_path(incoming_message, jpeg_attachment)).
          to eq("/request/#{incoming_message.info_request_id}" \
                "/response/#{incoming_message.id}/" \
                "attach/#{jpeg_attachment.url_part_number}" \
                "/interesting.jpg?cookie_passthrough=1")
      end

    end

    context 'when given an html format option' do

      it 'returns the path to the HTML version of the attachment' 


    end

  end

end

