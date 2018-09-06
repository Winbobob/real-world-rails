# Encoding: UTF-8
require "spec_helper"

module Refinery
  module Admin
    describe "Resources", :type => :feature do
      refinery_login

      context "when no files" do
        it "invites to upload file" 

      end

      it "shows upload file link" 


      context "new/create" do
        it "uploads file", :js => true do
          visit refinery.admin_resources_path
          find('a', text: 'Upload new file').trigger(:click)

          expect(page).to have_selector 'iframe#dialog_iframe'

          page.within_frame('dialog_iframe') do
            attach_file "resource_file", Refinery.roots('refinery/resources').
                                                  join("spec/fixtures/refinery_is_awesome.txt")
            click_button ::I18n.t('save', :scope => 'refinery.admin.form_actions')
          end

          expect(page).to have_content("Refinery Is Awesome")
          expect(Refinery::Resource.count).to eq(1)
        end

        describe "max file size" do
          before do
            allow(Refinery::Resources).to receive(:max_file_size).and_return('1224')
          end

          context "in english" do
            before do
              allow(Refinery::I18n).to receive(:current_locale).and_return(:en)
            end

            it "is shown" 

          end

          context "in danish" do
            before do
              allow(Refinery::I18n).to receive(:current_locale).and_return(:da)
            end

            it "is shown" 

          end
        end
      end

      context "edit/update" do
        let!(:resource) { FactoryBot.create(:resource) }

        it "updates file" 


        describe "translate" do
          before do
            allow(Refinery::I18n).to receive(:frontend_locales).and_return([:en, :fr])
          end

          it "can have a second locale added to it" 

        end
      end

      context "destroy" do
        let!(:resource) { FactoryBot.create(:resource) }

        it "removes file" 

      end

      context "download" do
        let!(:resource) { FactoryBot.create(:resource) }

        it "succeeds" 


        context 'when the extension is mounted with a named space' do
          before do
            Rails.application.routes.draw do
              mount Refinery::Core::Engine, :at => "/about"
            end
            Rails.application.routes_reloader.reload!
          end

          after do
            Rails.application.routes.draw do
              mount Refinery::Core::Engine, :at => "/"
            end
          end

          it "succeeds" 


        end
      end
    end
  end
end

