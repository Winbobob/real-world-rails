# frozen_string_literal: true
require 'rails_helper'

RSpec.describe System::Admin::Controller, type: :controller do
  controller do
    def index
      render body: 'Success'
    end
  end

  requires_login

  let(:instance) { Instance.default }

  with_tenant(:instance) do
    it 'allows instance administrators to access the page' 


    it 'does not allow users to access the page' 

  end
end

