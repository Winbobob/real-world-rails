# frozen_string_literal: true
require 'spec_helper'

describe 'Active Admin', type: :feature do
  VALID_MODELS = [:announcement, :app_config, :blackout, :category,
                  :checkin_procedure, :checkout_procedure, :equipment_item,
                  :equipment_model, :requirement, :reservation, :user].freeze

  context 'as superuser' do
    before { sign_in_as_user(@superuser) }
    after { sign_out }

    shared_examples 'can access route' do |model|
      let(:path) do
        admin_routes.index_url(model_name: model, host: Capybara.default_host)
      end

      it do
        visit path
        expect(page.current_url).to eq(path)
      end
    end

    it 'can access the dashboard' 


    VALID_MODELS.each do |mod|
      it_behaves_like 'can access route', mod
    end

    it 'can delete equipment items' 

  end

  context 'as other roles' do
    shared_examples 'cannot access route' do |model|
      if model
        let(:path) { admin_routes.index_path(model_name: model) }
      else
        let(:path) { admin_routes.dashboard_path }
      end

      it do
        visit path
        expect(page.current_url).to eq(root_url(host: Capybara.default_host))
      end
    end

    context 'as patron' do
      before { sign_in_as_user(@user) }
      after { sign_out }

      it_behaves_like 'cannot access route'

      VALID_MODELS.each do |mod|
        it_behaves_like 'cannot access route', mod
      end
    end

    context 'as checkout person' do
      before { sign_in_as_user(@checkout_person) }
      after { sign_out }

      it_behaves_like 'cannot access route'

      VALID_MODELS.each do |mod|
        it_behaves_like 'cannot access route', mod
      end
    end

    context 'as admin' do
      before { sign_in_as_user(@admin) }
      after { sign_out }

      it_behaves_like 'cannot access route'

      VALID_MODELS.each do |mod|
        it_behaves_like 'cannot access route', mod
      end
    end
  end
end

