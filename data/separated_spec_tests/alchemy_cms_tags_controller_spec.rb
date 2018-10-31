# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  module Admin
    describe TagsController do
      routes { Alchemy::Engine.routes }

      before { authorize_user(:as_admin) }

      describe '#create' do
        context 'without required params' do
          render_views

          it "does not create tag" 

        end

        context 'with required params' do
          it "creates tag and redirects to tags view" 

        end
      end

      describe '#edit' do
        let(:tag) { Gutentag::Tag.create(name: 'Sputz') }
        let(:another_tag) { Gutentag::Tag.create(name: 'Hutzl') }

        before { another_tag; tag }

        it "loads alls tags but not the one editing" 

      end

      describe '#update' do
        let(:tag) { Gutentag::Tag.create(name: 'Sputz') }

        it "changes tags name" 


        context 'with merg_to param given' do
          let(:another_tag) { Gutentag::Tag.create(name: 'Hutzl') }

          it "replaces tag with other tag" 

        end
      end
    end
  end
end

