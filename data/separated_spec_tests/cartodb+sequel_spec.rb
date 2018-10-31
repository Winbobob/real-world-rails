# encoding: utf-8
require_relative '../../../backend/sequel'
require_relative '../../../../../app/models/visualization/member'

include CartoDB

describe DataRepository::Backend::Sequel do
  before do
    db = SequelRails.connection
    db.create_table :visualizations do
      UUID      :id, primary_key: true
      String    :name
      String    :display_name
      String    :title
      String    :description
      String    :license
      String    :source
      String    :tags
      String    :map_id
      String    :active_layer_id
      String    :type
      String    :privacy
      String    :encrypted_password
      String    :password_salt
      UUID      :permission_id
      Boolean   :locked
      String    :parent_id
      String    :kind
      String    :prev_id
      String    :next_id
      String    :slide_transition_options
      String    :active_child
    end

    db.create_table :overlays do
      String    :id,                null: false, primary_key: true
      Integer   :order,             null: false
      String    :options,           text: true
      String    :type
      String    :visualization_id,  index: true
    end

    Visualization.repository = DataRepository::Backend::Sequel.new(db, :visualizations)
    Overlay.repository = DataRepository::Backend::Sequel.new(db, :overlays)
  end

  describe '#store' do
    it 'inserts a visualization' 


    it 'updates the visualization if existing' 

  end

  describe '#delete' do
    it 'deletes a visualization from persistence' 

  end

  describe '#collection' do
    it 'gets a collection of records using the passed filter' 

  end
end

