# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController, type: :controller do
  controller do
    include ExportControllerConcern
    def index
      send_export_file
    end

    def export_data
      @export.account.username
    end
  end

  describe 'GET #index' do
    it 'returns a csv of the exported data when signed in' 


    it 'returns unauthorized when not signed in' 

  end
end

