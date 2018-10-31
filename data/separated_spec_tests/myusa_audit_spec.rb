require 'spec_helper'

module Audit
  describe ApplicationController, type: :controller do
    class Dummy < ActiveRecord::Base
      audit_on :after_create
    end

    before :all do
      m = ActiveRecord::Migration
      m.verbose = false
      m.create_table :dummies do |t|
        t.integer :user_id
      end
    end
    after :all do
      m = ActiveRecord::Migration
      m.verbose = false
      m.drop_table :dummies
    end

    controller do
      def index
        sign_in User.find(params[:u])
        Dummy.create!
        render text: 'dummy'
      end
    end

    let(:user) { FactoryGirl.create(:user) }

    context 'create hooks' do
      before :each do
        allow(controller).to receive(:current_user) { user }
        get :index, u: user
      end

      it 'associates audit record with logged in user' 


      it 'sets the remote ip' 


      it 'audits model creation' 

    end
  end
end

