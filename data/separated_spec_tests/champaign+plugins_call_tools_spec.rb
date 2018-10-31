# frozen_string_literal: true

require 'rails_helper'

describe 'PUT plugins/call_tools/:id', type: :request do
  let(:call_tool) { create(:call_tool) }

  before(:each) { login_as(build(:user), scope: :user) }

  context 'given valid params' do
    let(:params) do
      {
        plugins_call_tool: {
          targets_csv_file: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'call_tool_data.csv'))
        }
      }
    end

    it 'returns successfully' 


    it 'updates the call tool instance' 

  end

  context 'given targets with accents' do
    let(:params) do
      {
        plugins_call_tool: {
          targets_csv_file: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'call_tool_data_with_accents.csv'))
        }
      }
    end

    it 'returns successfully' 


    it 'updates the call tool instance' 

  end

  context 'given invalid params' do
    let(:params) do
      {
        plugins_call_tool: {
          targets_csv_file: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'invalid_call_tool_data.csv'))
        }
      }
    end

    it 'returns 422' 

  end
end

