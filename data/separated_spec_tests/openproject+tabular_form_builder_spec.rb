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
require 'ostruct'

describe TabularFormBuilder do
  include Capybara::RSpecMatchers

  let(:helper)   { ActionView::Base.new }
  let(:resource) do
    FactoryBot.build(:user,
                     firstname:  'JJ',
                     lastname:   'Abrams',
                     login:      'lost',
                     mail:       'jj@lost-mail.com',
                     failed_login_count: 45)
  end
  let(:builder) { TabularFormBuilder.new(:user, resource, helper, {}) }

  describe '#text_field' do
    let(:options) { { title: 'Name', class: 'custom-class' } }

    subject(:output) do
      builder.text_field :name, options
    end

    it_behaves_like 'labelled by default'

    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'text-field-container'

    it 'should output element' 


    context 'with affixes' do
      let(:random_id) { 'random_id' }

      before do
        allow(SecureRandom)
          .to receive(:uuid)
          .and_return(random_id)
      end

      context 'with a prefix' do
        let(:options) { { title: 'Name', prefix: %{<span style="color:red">Prefix</span>} } }

        it 'should output elements' 


        it 'includes the prefix hidden in the label' 

      end

      context 'with a suffix' do
        let(:options) { { title: 'Name', suffix: %{<span style="color:blue">Suffix</span>} } }

        it 'should output elements' 

      end

      context 'with both prefix and suffix' do
        let(:options) do
          {
            title: 'Name',
            prefix: %{<span style="color:yellow">PREFIX</span>},
            suffix: %{<span style="color:green">SUFFIX</span>}
          }
        end

        it 'should output elements' 


        it 'includes the prefix hidden in the label' 

      end
    end
  end

  describe '#text_area' do
    let(:options) { { title: 'Name', class: 'custom-class' } }

    subject(:output) do
      builder.text_area :name, options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'text-area-container'

    it 'should output element' 


    context 'when requesting a text formatting wrapper' do
      let(:options) { { title: 'Name', class: 'custom-class', with_text_formatting: true } }

      context 'an id is missing' do
        it 'outputs the wysiwyg wrapper' 

      end

      context 'with id present' do
        let(:options) { { id: 'my-id', title: 'Name', class: 'custom-class', with_text_formatting: true } }

        it 'outputs the wysiwyg wrapper' 

      end
    end
  end

  describe '#select' do
    let(:options) { { title: 'Name' } }
    let(:html_options) { { class: 'custom-class' } }

    subject(:output) do
      builder.select :name, '<option value="33">FUN</option>'.html_safe, options, html_options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'select-container'

    it 'should output element' 

  end

  describe '#collection_select' do
    let(:options) { { title: 'Name' } }
    let(:html_options) { { class: 'custom-class' } }

    subject(:output) do
      builder.collection_select :name, [
        OpenStruct.new(id: 56, name: 'Diana'),
        OpenStruct.new(id: 46, name: 'Ricky'),
        OpenStruct.new(id: 33, name: 'Jonas')
      ], :id, :name, options, html_options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'select-container'

    it 'should output element' 

  end

  describe '#date_select' do
    let(:options) { { title: 'Last logged in on' } }

    subject(:output) do
      builder.date_select :last_login_on, options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'

    it 'should output element' 

  end

  describe '#check_box' do
    let(:options) { { title: 'Name', class: 'custom-class' } }

    subject(:output) do
      builder.check_box :first_login, options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'check-box-container'

    it 'should output element' 

  end

  describe '#collection_check_box' do
    let(:options) { {} }

    subject(:output) do
      builder.collection_check_box :enabled_module_names,
                                   :repositories,
                                   true,
                                   'name',
                                   options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'check-box-container'

    it 'should output element' 

  end

  describe '#radio_button' do
    let(:options) { { title: 'Name', class: 'custom-class' } }

    subject(:output) do
      builder.radio_button :name, 'John', options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in container'
    it_behaves_like 'wrapped in container', 'radio-button-container'

    it 'should output element' 

  end

  describe '#number_field' do
    let(:options) { { title: 'Bad logins', class: 'custom-class' } }

    subject(:output) do
      builder.number_field :failed_login_count, options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'text-field-container'

    it 'should output element' 

  end

  describe '#range_field' do
    let(:options) { { title: 'Bad logins', class: 'custom-class' } }

    subject(:output) do
      builder.range_field :failed_login_count, options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'range-field-container'

    it 'should output element' 

  end

  describe '#search_field' do
    let(:options) { { title: 'Search name', class: 'custom-class' } }

    subject(:output) do
      builder.search_field :name, options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'search-field-container'

    it 'should output element' 

  end

  describe '#email_field' do
    let(:options) { { title: 'Email', class: 'custom-class' } }

    subject(:output) do
      builder.email_field :mail, options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'text-field-container'

    it 'should output element' 

  end

  describe '#telephone_field' do
    let(:options) { { title: 'Not really email', class: 'custom-class' } }

    subject(:output) do
      builder.telephone_field :mail, options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'text-field-container'

    it 'should output element' 

  end

  describe '#password_field' do
    let(:options) { { title: 'Not really password', class: 'custom-class' } }

    subject(:output) do
      builder.password_field :login, options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'text-field-container'

    it 'should output element' 

  end

  describe '#file_field' do
    let(:options) { { title: 'Not really file', class: 'custom-class' } }

    subject(:output) do
      builder.file_field :name, options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'file-field-container'

    it 'should output element' 

  end

  describe '#url_field' do
    let(:options) { { title: 'Not really file', class: 'custom-class' } }

    subject(:output) do
      builder.url_field :name, options
    end

    it_behaves_like 'labelled by default'
    it_behaves_like 'wrapped in field-container by default'
    it_behaves_like 'wrapped in container', 'text-field-container'

    it 'should output element' 

  end

  describe '#submit' do
    subject(:output) do
      Capybara::Node::Simple.new(builder.submit)
    end

    it_behaves_like 'not labelled'
    it_behaves_like 'not wrapped in container'
    it_behaves_like 'not wrapped in container', 'submit-container'

    it 'should output element' 

  end

  describe '#button' do
    subject(:output) do
      builder.button
    end

    it_behaves_like 'not labelled'
    it_behaves_like 'not wrapped in container'
    it_behaves_like 'not wrapped in container', 'button-container'

    it 'should output element' 

  end

  describe '#label' do
    subject(:output) { builder.label :name }

    it 'should output element' 


    describe 'with existing attributes' do
      subject(:output) { builder.label :name, 'Fear', class: 'sharknado', title: 'Fear' }

      it 'should keep associated classes' 

    end

    describe 'when using it without ActiveModel' do
      let(:resource) { OpenStruct.new name: 'Deadpool' }

      it 'should fall back to the method name' 

    end
  end

  # test the label that is generated for various field types
  describe 'labels for fields' do
    let(:options) { {} }
    shared_examples_for 'generated label' do
      def expected_label_like(expected_title, expected_classes = 'form--label')
        expect(output).to be_html_eql(%{
          <label class="#{expected_classes}"
                 for="user_name"
                 title="#{expected_title}">
            #{expected_title}
          </label>
        }).at_path('label')
      end

      def expected_required_label_like(expected_title, expected_classes = 'form--label')
        expect(output).to be_html_eql(%{
          <label class="#{expected_classes}"
                 for="user_name"
                 title="#{expected_title}">
            #{expected_title}
            <span class="form--label-required" aria-hidden="true">*</span>
          </label>
        }).at_path('label')
      end

      context 'with a label specified as string' do
        let(:text) { 'My own label' }

        before do
          options[:label] = text
        end

        it 'uses the label' 

      end

      context 'with a label specified as symbol' do
        let(:text) { :name }

        before do
          options[:label] = text
        end

        it 'uses the label' 

      end

      context 'without ActiveModel and specified label' do
        let(:resource) { OpenStruct.new name: 'Deadpool' }

        it 'falls back to the I18n name' 

      end

      context 'with ActiveModel and without specified label' do
        let(:resource) do
          FactoryBot.build_stubbed(:user,
                                   firstname:  'JJ',
                                   lastname:   'Abrams',
                                   login:      'lost',
                                   mail:       'jj@lost-mail.com',
                                   failed_login_count: 45)
        end

        it 'uses the human attibute name' 


        context 'with erroneous field' do
          before do
            resource.errors.add(:name, :invalid)
            resource.errors.add(:name, :inclusion)
          end

          it 'shows an appropriate error label' 


          it 'contains a specific error as a hidden sub-label' 

        end
      end

      context 'when required, with a label specified as symbol' do
        let(:text) { :name }

        before do
          options[:label] = text
          options[:required] = true
        end

        it 'uses the label' 

      end
    end

    %w{ text_field
        text_area
        check_box
        password_field }.each do |input_type|
      context "for #{input_type}" do
        subject(:output) do
          builder.send(input_type, :name, options)
        end

        it_behaves_like 'generated label'
      end
    end

    context 'for select' do
      subject(:output) do
        builder.select :name, [], options
      end

      it_behaves_like 'generated label'
    end
  end
end

