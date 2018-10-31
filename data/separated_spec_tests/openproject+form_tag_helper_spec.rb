#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe OpenProject::FormTagHelper, type: :helper do
  let(:options) { {} }

  describe '#styled_form_tag' do
    subject(:output) {
      helper.styled_form_tag('/feedback', options) do
        content_tag(:p, 'Form content')
      end
    }

    it_behaves_like 'not wrapped in container', 'form-container'

    it 'should output element' 

  end

  describe '#styled_select_tag' do
    subject(:output) {
      helper.styled_select_tag('field', '<option value="33">FUN</option>'.html_safe, options)
    }

    it_behaves_like 'wrapped in container', 'select-container'

    it 'should output element' 

  end

  describe '#styled_text_field_tag' do
    let(:value) { 'Something to be seen' }

    subject(:output) {
      helper.styled_text_field_tag('field', value, options)
    }

    it_behaves_like 'wrapped in container', 'text-field-container'

    it 'should output element' 

  end

  describe '#styled_label_tag' do
    context 'with block' do
      subject(:output) {
        helper.styled_label_tag('field', nil, options) do
          'Label content'
        end
      }

      it_behaves_like 'not wrapped in container', 'label-container'

      it 'should output element' 

    end

    context 'with content arg' do
      subject(:output) {
        helper.styled_label_tag('field', 'Label content', options)
      }

      it_behaves_like 'not wrapped in container', 'label-container'

      it 'should output element' 

    end

    context 'titles' do
      it 'should use the title from the options if given' 


      it 'should prefer the title given in the options over the content' 


      it 'should strip any given inline HTML from the title tag (with block)' 


      it 'should strip any given inline HTML from the title tag (with content arg)' 

    end
  end

  describe '#styled_file_field_tag' do
    subject(:output) {
      helper.styled_file_field_tag('file_field', options)
    }

    it_behaves_like 'wrapped in container', 'file-field-container'

    it 'should output element' 

  end

  describe '#styled_password_field_tag' do
    subject(:output) {
      helper.styled_password_field_tag('password', 'nopE3king!', options)
    }

    it_behaves_like 'wrapped in container', 'text-field-container'

    it 'should output element' 

  end

  describe '#styled_text_area_tag' do
    subject(:output) {
      helper.styled_text_area_tag('field', 'Words are important', options)
    }

    it_behaves_like 'wrapped in container', 'text-area-container'

    it 'should output element' 

  end

  describe '#styled_check_box_tag' do
    subject(:output) {
      helper.styled_check_box_tag('field', '1', false, options)
    }

    it_behaves_like 'wrapped in container', 'check-box-container'

    it 'should output element' 

  end

  describe '#styled_radio_button_tag' do
    let(:value) { 'good choice' }

    subject(:output) {
      helper.styled_radio_button_tag('field', value, false, options)
    }

    it_behaves_like 'wrapped in container', 'radio-button-container'

    it 'should output element' 

  end

  describe '#styled_submit_tag' do
    subject(:output) {
      helper.styled_submit_tag('Save it!', options)
    }
    subject(:html) {
      Capybara::Node::Simple.new(output)
    }

    it_behaves_like 'not wrapped in container', 'submit-container'

    it 'should output element' 

  end

  describe '#styled_button_tag' do
    subject(:output) {
      helper.styled_button_tag(options) do
        "Don't save!"
      end
    }

    it_behaves_like 'not wrapped in container', 'button-container'

    it 'should output element' 

  end

  describe '#styled_field_set_tag' do
    subject(:output) {
      helper.styled_field_set_tag('Fieldset Legend', options) do
        content_tag(:p, 'Fieldset content')
      end
    }

    it_behaves_like 'not wrapped in container', 'fieldset-container'

    it 'should output element' 

  end

  describe '#styled_search_field_tag' do
    let(:value) { 'Find me' }

    subject(:output) {
      helper.styled_search_field_tag('field', value, options)
    }

    it_behaves_like 'wrapped in container', 'search-field-container'

    it 'should output element' 

  end

  describe '#styled_telephone_field_tag' do
    let(:value) { '+49 555 111 999' }

    subject(:output) {
      helper.styled_telephone_field_tag('field', value, options)
    }

    it_behaves_like 'wrapped in container', 'text-field-container'

    it 'should output element' 

  end

  describe '#styled_url_field_tag' do
    let(:value) { 'https://blogger.org/' }

    subject(:output) {
      helper.styled_url_field_tag('field', value, options)
    }

    it_behaves_like 'wrapped in container', 'text-field-container'

    it 'should output element' 

  end

  describe '#styled_email_field_tag' do
    let(:value) { 'joe@blogger.com' }

    subject(:output) {
      helper.styled_email_field_tag('field', value, options)
    }

    it_behaves_like 'wrapped in container', 'text-field-container'

    it 'should output element' 

  end

  describe '#styled_number_field_tag' do
    let(:value) { 2 }

    subject(:output) {
      helper.styled_number_field_tag('field', value, options)
    }

    it_behaves_like 'wrapped in container', 'text-field-container'

    it 'should output element' 

  end

  describe '#styled_range_field_tag' do
    let(:value) { 2 }

    subject(:output) {
      helper.styled_range_field_tag('field', value, options)
    }

    it_behaves_like 'wrapped in container', 'range-field-container'

    it 'should output element' 

  end
end

