# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe MessagesController do
    routes { Alchemy::Engine.routes }

    let(:page) { mock_model('Page') }

    before do
      controller.instance_variable_set(:@page, page)
      allow(controller).to receive(:get_page).and_return(page)
    end

    describe "#index" do
      let(:page) { mock_model('Page', {urlname: 'contact', page_layout: 'contact'}) }

      it "should redirect to @page" 

    end

    describe "#new" do
      it "should render the alchemy/pages/show template" 

    end

    describe "#create" do
      subject do
        post :create, params: {message: {email: ''}}
      end

      let(:page)    { mock_model('Page', get_language_root: mock_model('Page')) }
      let(:element) { mock_model('Element', page: page, ingredient: '') }
      let(:message) { Message.new }

      it "should raise ActiveRecord::RecordNotFound if element of contactform could not be found" 


      context "if validation of message" do
        before do
          allow(Element).to receive(:find_by).and_return(element)
          allow(element).to receive(:ingredient).with(:success_page).and_return('thank-you')
          allow_any_instance_of(Message).to receive(:contact_form_id).and_return(1)
        end

        context "failed" do
          before do
            allow_any_instance_of(Message).to receive(:valid?).and_return(false)
          end

          it "should render 'alchemy/pages/show' template" 

        end

        context "succeeded" do
          before do
            allow_any_instance_of(Message).to receive(:valid?).and_return(true)
            allow(MessagesMailer).to receive(:contact_form_mail).and_return double(deliver: true)
          end

          it "Messages should call Messages#contact_form_mail to send the email" 


          describe '#mail_to' do
            context "with element having mail_to ingredient" do
              before do
                allow(element).to receive(:ingredient).with(:mail_to).and_return('peter@schroeder.de')
                message
                allow(Message).to receive(:new).and_return(message)
              end

              it "returns the ingredient" 

            end

            context "with element having no mail_to ingredient" do
              before do
                allow(element).to receive(:ingredient).with(:mail_to).and_return(nil)
                message
                allow(Message).to receive(:new).and_return(message)
              end

              it "returns the config value" 

            end
          end

          describe '#mail_from' do
            context "with element having mail_from ingredient" do
              before do
                allow(element).to receive(:ingredient).with(:mail_from).and_return('peter@schroeder.de')
                message
                allow(Message).to receive(:new).and_return(message)
              end

              it "returns the ingredient" 

            end

            context "with element having no mail_from ingredient" do
              before do
                allow(element).to receive(:ingredient).with(:mail_from).and_return(nil)
                message
                allow(Message).to receive(:new).and_return(message)
              end

              it "returns the config value" 

            end
          end

          describe '#subject' do
            context "with element having subject ingredient" do
              before do
                allow(element).to receive(:ingredient).with(:subject).and_return('A new message')
                message
                allow(Message).to receive(:new).and_return(message)
              end

              it "returns the ingredient" 

            end

            context "with element having no subject ingredient" do
              before do
                allow(element).to receive(:ingredient).with(:subject).and_return(nil)
                message
                allow(Message).to receive(:new).and_return(message)
              end

              it "returns the config value" 

            end
          end

          describe "#redirect_to_success_page" do
            context "if 'success_page' ingredient of element is set with urlname" do
              before do
                allow(element).to receive(:ingredient).with(:success_page).and_return('success-page')
              end

              it "should redirect to the given urlname" 

            end

            context "if 'success_page' ingredient of element is not set" do
              before do
                allow(element).to receive(:ingredient).with(:success_page).and_return(nil)
              end

              context "but mailer_config['forward_to_page'] is true and mailer_config['mail_success_page'] is set" do
                before do
                  allow(controller).to receive(:mailer_config) do
                    {
                      'fields' => %w(email),
                      'forward_to_page' => true,
                      'mail_success_page' => 'mailer-config-success-page'
                    }
                  end
                  allow(Page).to receive(:find_by).and_return double(urlname: 'mailer-config-success-page')
                end

                it "redirect to the given success page" 

              end

              context "and mailer_config has no instructions for success_page" do
                let(:language) { mock_model('Language', code: 'en', locale: 'en', pages: double(find_by: build_stubbed(:alchemy_page))) }

                before do
                  allow(controller).to receive(:mailer_config).and_return({'fields' => %w(email)})
                  allow(Language).to receive(:current_root_page).and_return double(urlname: 'lang-root')
                end

                it "should redirect to the language root page" 

              end
            end
          end
        end
      end
    end
  end
end

