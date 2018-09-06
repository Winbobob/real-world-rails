# frozen_string_literal: true
require 'spec_helper'
include CsvExport

describe CsvExport do
  MODELS = [:user, :category, :equipment_model, :equipment_item].freeze
  PROTECTED_COLS = %w(id encrypted_password reset_password_token
                      reset_password_sent_at).freeze

  shared_examples 'builds a csv' do |model|
    let(:csv) do
      generate_csv(FactoryGirl.build_list(model, 5)).split("\n")
    end

    it 'has the appropriate length' 


    it 'has the appropriate columns' 


    it "doesn't include protected columns" 


    it 'limits columns appropriately' 

  end

  MODELS.each { |m| it_behaves_like 'builds a csv', m }
end

