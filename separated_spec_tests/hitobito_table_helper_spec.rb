# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'


describe TableHelper do

  include LayoutHelper
  include I18nHelper
  include UtilityHelper
  include ActionHelper
  include FormatHelper
  include CrudTestHelper

  def can?(*args)
    true
  end

  before(:all) do
    reset_db
    setup_db
    create_test_data
  end

  after(:all) { reset_db }


  describe '#list_table' do
    let(:entries) { CrudTestModel.all }

    context 'default' do
      subject do
        with_test_routing { list_table }
      end

      it 'should have 7 rows' 


      it 'should have 13 sortable headers' 

    end

    context 'with custom attributes' do
      subject do
        with_test_routing { list_table(:name, :children, :companion_id) }
      end

      it 'should have 7 rows' 


      it 'should have 3 sortable headers' 

    end

    context 'with custom block' do
      subject do
        with_test_routing do
          list_table do |t|
            t.attrs :name, :children, :companion_id
            t.col('head') { |e| content_tag(:span, e.income.to_s) }
          end
        end
      end

      it 'should have 7 rows' 


      it 'should have 4 headers' 


      it 'should have 0 sortable headers' 


      it 'should have 6 spans' 

    end

    context 'with custom attributes and block' do
      subject do
        with_test_routing do
          list_table(:name, :children, :companion_id) do |t|
            t.col('head') { |e| content_tag(:span, e.income.to_s) }
          end
        end
      end

      it 'should have 7 rows' 


      it 'should have 4 headers' 


      it 'should have 3 sortable headers' 


      it 'should have 6 spans' 

    end

    context 'with ascending sort params' do
      let(:params) { { sort: 'children', sort_dir: 'asc' } }
      subject do
        with_test_routing { list_table }
      end

      it 'should have 12 sortable headers' 


      it 'should have 1 ascending sort headers' 

    end

    context 'with descending sort params' do
      let(:params) { { sort: 'children', sort_dir: 'desc' } }
      subject do
        with_test_routing { list_table }
      end

      it 'should have 12 sortable headers' 


      it 'should have 1 descending sort headers' 

    end

    context 'with custom column sort params' do
      let(:params) { { sort: 'chatty', sort_dir: 'asc' } }
      subject do
        with_test_routing { list_table(:name, :children, :chatty) }
      end

      it 'should have 2 sortable headers' 


      it 'should have 1 ascending sort headers' 

    end
  end

  describe '#default_attrs' do
    it 'should not contain id' 
      it 'should have 7 rows' 


      it 'should have 13 sort headers' 


      it 'should have 12 action cells' 

    end

    context 'with custom attrs' do
      subject do
        with_test_routing { crud_table(:name, :children, :companion_id) }
      end

      it 'should have 3 sort headers' 

    end

    context 'with custom block' do
      subject do
        with_test_routing do
          crud_table do |t|
            t.attrs :name, :children, :companion_id
            t.col('head') { |e| content_tag :span, e.income.to_s }
          end
        end
      end

      it 'should have 4 headers' 


      it 'should have 6 custom col spans' 


      it 'should have 0 action cells' 

    end

    context 'with custom attributes and block' do
      subject do
        with_test_routing do
          crud_table(:name, :children, :companion_id) do |t|
            t.col('head') { |e| content_tag :span, e.income.to_s }
          end
        end
      end

      it 'should have 3 sort headers' 


      it 'should have 6 custom col spans' 


      it 'should have 0 action cells' 

    end
  end

  describe '#table' do
    context 'with empty data' do
      subject { table([]) }

      it { is_expected.to be_html_safe }

      it 'should handle empty data' 

    end

    context 'with data' do
      subject { table(%w(foo bar), :size) { |t| t.attrs :upcase } }

      it { is_expected.to be_html_safe }

      it 'should render table' 


      it 'should contain attrs' 


      it 'should contain block' 

    end
  end

end

