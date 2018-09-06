# frozen_string_literal: true

require 'rails_helper'

describe 'PUT plugins/email_tools/:id', type: :request do
  let(:email_tool) { create(:email_tool) }

  before(:each) { login_as(build(:user), scope: :user) }

  context 'given valid params' do
    let(:params) do
      {
        plugins_email_tool: {
          targets_csv_text: "email, name\njohn@gmail.com, John Doe"
        }
      }
    end

    it 'returns successfully' 


    it 'updates the email tool instance' 

  end

  context 'given invalid params' do
    let(:params) do
      {
        plugins_email_tool: {
          targets_csv_text: "email, name\n,\n"
        }
      }
    end

    it 'returns 422' 

  end
end

