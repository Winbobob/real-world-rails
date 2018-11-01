# frozen_string_literal: true

require 'spec_helper'
require 'cancan/matchers'

describe Alchemy::Permissions do
  subject { ability }

  let(:ability)                 { Alchemy::Permissions.new(user) }
  let(:attachment)              { mock_model(Alchemy::Attachment, restricted?: false) }
  let(:restricted_attachment)   { mock_model(Alchemy::Attachment, restricted?: true) }
  let(:picture)                 { mock_model(Alchemy::Picture, restricted?: false) }
  let(:restricted_picture)      { mock_model(Alchemy::Picture, restricted?: true) }
  let(:public_page)             { build_stubbed(:alchemy_page, :public, restricted: false) }
  let(:unpublic_page)           { build_stubbed(:alchemy_page) }
  let(:visible_page)            { build_stubbed(:alchemy_page, restricted: false, visible: true) }
  let(:not_visible_page)        { build_stubbed(:alchemy_page, :public, restricted: false, visible: false) }
  let(:restricted_page)         { build_stubbed(:alchemy_page, :public, restricted: true) }
  let(:visible_restricted_page) { build_stubbed(:alchemy_page, visible: true, restricted: true) }
  let(:published_element)       { mock_model(Alchemy::Element, restricted?: false, public?: true, trashed?: false) }
  let(:restricted_element)      { mock_model(Alchemy::Element, restricted?: true, public?: true, trashed?: false) }
  let(:published_content)       { mock_model(Alchemy::Content, restricted?: false, public?: true, trashed?: false) }
  let(:restricted_content)      { mock_model(Alchemy::Content, restricted?: true, public?: true, trashed?: false) }

  context "A guest user" do
    let(:user) { nil }

    it "can only download not restricted attachments" 


    it "can only see not restricted attachments" 


    it "can only visit not restricted pages" 


    it "can only see visible not restricted pages" 


    it "can only see public not restricted elements" 


    it "can only see public not restricted contents" 

  end

  context "A member" do
    let(:user) { build(:alchemy_dummy_user) }

    it "can download all attachments" 


    it "can see all attachments" 


    it "can visit restricted pages" 


    it "can see visible restricted pages" 


    it "can not see invisible pages" 


    it "can see public restricted elements" 


    it "can see public restricted contents" 

  end

  context "An author" do
    let(:user) { build(:alchemy_dummy_user, :as_author) }

    it "can leave the admin area" 


    it "can visit the dashboard" 


    it "can edit page content" 


    it "can not publish pages" 


    it "can manage elements" 


    it "can see all attachments" 


    it "can see all pictures" 


    it "can manage contents" 


    it "can manage essences" 


    it "can see the trash" 


    it "can manage the clipboard" 


    it "can see tags" 


    it "can index layoutpages" 

  end

  context "An editor" do
    let(:user) { build(:alchemy_dummy_user, :as_editor) }

    it "can manage pages" 


    it "can publish pages" 


    it "can not see invisible pages" 


    it "can clear the trash" 


    it "can manage attachments" 


    it "can manage pictures" 


    it "can manage tags" 

  end

  context "An admin" do
    let(:user) { build(:alchemy_dummy_user, :as_admin) }

    it "can check for alchemy updates" 


    it "can manage languages" 


    it "can manage sites" 

  end

  context "A logged in user without a role" do
    let(:user) { mock_model(Alchemy.user_class, alchemy_roles: []) }

    it "can only see visible not restricted pages (like the guest role)" 

  end
end

