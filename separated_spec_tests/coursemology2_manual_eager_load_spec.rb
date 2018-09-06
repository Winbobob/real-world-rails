# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Extension: Manual Eager Load', type: :model do
  class self::SourceItem < ApplicationRecord
    has_many :referenced_items, inverse_of: :source_item
    has_one :singular_item, inverse_of: :source_item
  end
  class self::ReferencedItem < ApplicationRecord
    belongs_to :source_item, inverse_of: :referenced_items
  end
  class self::SingularItem < ApplicationRecord
    self.table_name = 'referenced_items'
    belongs_to :source_item, inverse_of: :referenced_items
  end

  temporary_table(:source_items) do |t|
    t.string :test
  end
  temporary_table(:referenced_items) do |t|
    t.references :source_item, foreign_key: nil
  end
  with_temporary_table(:source_items) do
    with_temporary_table(:referenced_items) do
      let(:preloader) { ActiveRecord::Associations::Preloader::ManualPreloader.new }
      let(:source) { self.class::SourceItem.create }
      let(:referenced1) { self.class::ReferencedItem.create(source_item: source) }
      let(:referenced2) { self.class::ReferencedItem.create(source_item: source) }
      let(:referenced3) { self.class::ReferencedItem.create(source_item: source) }

      context 'when eager loading a has_one relation' do
        before do
          referenced1

          source.reload
        end

        it 'fails with NotImplementedError' 

      end

      context 'when eager loading a has_many relation' do
        before do
          referenced1
          referenced2
          referenced3

          source.reload
          preloader.preload(source, :referenced_items, eager_load_items)
        end

        let(:eager_load_items) { [referenced1, referenced3] }
        it 'marks the association as loaded' 


        it 'preserves the order of the items' 


        it 'sets the inverse for the eager loaded items' 

      end

      context 'when the association has already been loaded' do
        before do
          source.association(:referenced_items).loaded!
          source.referenced_items << referenced1
          preloader.preload(source, :referenced_items, [referenced2])
        end

        it 'does not change the target' 

      end
    end

    describe ActiveRecord::Associations::Preloader::ManualAssociationPreloader do
      class self::DummyPreloader
        include ActiveRecord::Associations::Preloader::ManualAssociationPreloader

        def initialize
        end
      end

      subject { self.class::DummyPreloader.new }

      describe '#scope' do
        it 'raises when scope is called' 

      end
    end
  end
end

