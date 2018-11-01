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

describe ::API::V3::Utilities::CustomFieldInjector do
  include API::V3::Utilities::PathHelper

  let(:cf_path) { "customField#{custom_field.id}" }
  let(:field_format) { 'bool' }
  let(:custom_field) do
    FactoryBot.build(:custom_field,
                     id: 1,
                     field_format: field_format,
                     is_required: true)
  end

  describe 'TYPE_MAP' do
    it 'supports all available formats' 

  end

  describe '#inject_schema' do
    let(:base_class) { Class.new(::API::Decorators::SchemaRepresenter) }
    let(:modified_class) { described_class.create_schema_representer([custom_field], base_class) }
    let(:schema) do
      double('WorkPackageSchema',
             project_id: 42,
             defines_assignable_values?: true,
             available_custom_fields: [custom_field])
    end

    subject { modified_class.new(schema, current_user: nil, form_embedded: true).to_json }

    describe 'basic custom field' do
      let(:path) { cf_path }

      it_behaves_like 'has basic schema properties' do
        let(:type) { 'Boolean' }
        let(:name) { custom_field.name }
        let(:required) { true }
        let(:writable) { true }
        let(:has_default) { false }
      end

      context 'with default set' do
        let(:custom_field) do
          FactoryBot.build(:custom_field,
                           id: 1,
                           field_format: 'string',
                           default_value: 'foo',
                           is_required: true)
        end

        it_behaves_like 'has basic schema properties' do
          let(:type) { 'String' }
          let(:name) { custom_field.name }
          let(:required) { true }
          let(:writable) { true }
          let(:has_default) { true }
        end
      end

      it 'indicates no regular expression' 


      # meaning they won't as no values are specified
      it_behaves_like 'indicates length requirements'

      context 'custom field is not required' do
        let(:custom_field) { FactoryBot.build(:custom_field, is_required: false) }

        it 'marks the field as not required' 

      end

      context 'custom field has regex' do
        let(:custom_field) { FactoryBot.build(:custom_field, regexp: 'Foo+bar') }

        it 'renders the regular expression' 

      end

      context 'custom field has minimum length' do
        let(:custom_field) { FactoryBot.build(:custom_field, min_length: 5) }

        it_behaves_like 'indicates length requirements' do
          let(:min_length) { 5 }
        end
      end

      context 'custom field has maximum length' do
        let(:custom_field) { FactoryBot.build(:custom_field, max_length: 5) }

        it_behaves_like 'indicates length requirements' do
          let(:max_length) { 5 }
        end
      end
    end

    describe 'version custom field' do
      let(:custom_field) do
        FactoryBot.build(:version_wp_custom_field,
                         is_required: true)
      end

      let(:assignable_versions) { FactoryBot.build_list(:version, 3) }

      before do
        allow(schema)
          .to receive(:assignable_custom_field_values)
          .with(custom_field)
          .and_return(assignable_versions)

        allow(::API::V3::Versions::VersionRepresenter).to receive(:new).and_return(double)
      end

      it_behaves_like 'has basic schema properties' do
        let(:path) { cf_path }
        let(:type) { 'Version' }
        let(:name) { custom_field.name }
        let(:required) { true }
        let(:writable) { true }
      end

      it_behaves_like 'links to allowed values directly' do
        let(:path) { cf_path }
        let(:hrefs) { assignable_versions.map { |version| api_v3_paths.version version.id } }
      end

      it 'embeds allowed values' 

    end

    describe 'list custom field' do
      before do
        allow(schema)
          .to receive(:assignable_custom_field_values)
          .with(custom_field)
          .and_return(custom_field.possible_values)
      end

      let(:custom_field) do
        FactoryBot.create(
          :list_wp_custom_field,
          is_required: true,
          possible_values: values
        )
      end

      let(:values) { ['foo', 'bar', 'baz'] }

      it_behaves_like 'has basic schema properties' do
        let(:path) { cf_path }
        let(:type) { 'CustomOption' }
        let(:name) { custom_field.name }
        let(:required) { true }
        let(:writable) { true }
      end

      it_behaves_like 'links to and embeds allowed values directly' do
        let(:path) { cf_path }
        let(:hrefs) do
          custom_field.possible_values.map do |value|
            api_v3_paths.custom_option(value.id)
          end
        end
      end
    end

    describe 'user custom field' do
      let(:custom_field) do
        FactoryBot.build(:custom_field,
                         field_format: 'user',
                         is_required: true)
      end

      it_behaves_like 'has basic schema properties' do
        let(:path) { cf_path }
        let(:type) { 'User' }
        let(:name) { custom_field.name }
        let(:required) { true }
        let(:writable) { true }
      end

      it_behaves_like 'links to allowed values via collection link' do
        let(:path) { cf_path }
        let(:href) do
          params = [{ status: { operator: '!',
                                values: [Principal::STATUSES[:builtin].to_s,
                                         Principal::STATUSES[:locked].to_s] } },
                    { type: { operator: '=', values: ['User'] } },
                    { member: { operator: '=', values: [schema.project_id.to_s] } }]

          query = CGI.escape(::JSON.dump(params))

          "#{api_v3_paths.principals}?filters=#{query}&pageSize=0"
        end
      end
    end
  end

  describe '#inject_value' do
    shared_examples_for 'injects property custom field' do
      it 'has a readable value' 


      it 'on writing it sets on the represented' 

    end

    let(:base_class) { Class.new(::API::Decorators::Single) }
    let(:modified_class) { described_class.create_value_representer([custom_field], base_class) }
    let(:represented) do
      double('represented',
             available_custom_fields: [custom_field],
             custom_field.accessor_name => value)
    end
    let(:custom_value) { double('CustomValue', value: raw_value, typed_value: typed_value) }
    let(:raw_value) { nil }
    let(:typed_value) { raw_value }
    let(:value) { '' }
    let(:current_user) { FactoryBot.build(:user) }
    subject { modified_class.new(represented, current_user: current_user, embed_links: true).to_json }

    before do
      # should only be called when building links
      allow(represented).to receive(:custom_value_for).with(custom_field).and_return(custom_value)
    end

    context 'user custom field' do
      let(:value) { FactoryBot.build(:user, id: 2) }
      let(:raw_value) { value.id.to_s }
      let(:typed_value) { value }
      let(:field_format) { 'user' }

      it_behaves_like 'has a titled link' do
        let(:link) { cf_path }
        let(:href) { api_v3_paths.user 2 }
        let(:title) { value.name }
      end

      it 'has the user embedded' 


      context 'value is nil' do
        let(:value) { nil }
        let(:raw_value) { '' }

        it_behaves_like 'has an empty link' do
          let(:link) { cf_path }
        end
      end
    end

    context 'version custom field' do
      let(:value) { FactoryBot.build_stubbed(:version, id: 2) }
      let(:raw_value) { value.id.to_s }
      let(:typed_value) { value }
      let(:field_format) { 'version' }

      it_behaves_like 'has a titled link' do
        let(:link) { cf_path }
        let(:href) { api_v3_paths.version 2 }
        let(:title) { value.name }
      end

      it 'has the version embedded' 


      context 'value is nil' do
        let(:value) { nil }
        let(:raw_value) { '' }

        it_behaves_like 'has an empty link' do
          let(:link) { cf_path }
        end
      end
    end

    context 'list custom field' do
      let(:value) { FactoryBot.build_stubbed(:custom_option) }
      let(:typed_value) { value.value }
      let(:raw_value) { value.id.to_s }
      let(:field_format) { 'list' }

      it_behaves_like 'has a titled link' do
        let(:link) { cf_path }
        let(:href) { api_v3_paths.custom_option(value.id) }
        let(:title) { value.value }
      end

      context 'value is nil' do
        let(:value) { nil }
        let(:raw_value) { '' }
        let(:typed_value) { '' }

        it_behaves_like 'has an empty link' do
          let(:link) { cf_path }
        end
      end

      context 'value is some invalid string' do
        let(:value) { 'some invalid string' }
        let(:raw_value) { 'some invalid string' }
        let(:typed_value) { 'some invalid string not found' }

        it 'has an empty href' 


        it 'has the invalid value as title' 

      end
    end

    context 'string custom field' do
      it_behaves_like 'injects property custom field' do
        let(:field_format) { 'string' }
        let(:value) { 'Foobar' }
        let(:json_value) { 'Foobar' }
        let(:expected_setter) { json_value }
      end
    end

    context 'int custom field' do
      it_behaves_like 'injects property custom field' do
        let(:field_format) { 'int' }
        let(:value) { 42 }
        let(:json_value) { 42 }
        let(:expected_setter) { json_value }
      end
    end

    context 'float custom field' do
      it_behaves_like 'injects property custom field' do
        let(:field_format) { 'float' }
        let(:value) { 3.14 }
        let(:json_value) { 3.14 }
        let(:expected_setter) { json_value }
      end
    end

    context 'bool custom field' do
      it_behaves_like 'injects property custom field' do
        let(:field_format) { 'bool' }
        let(:value) { true }
        let(:json_value) { true }
        let(:expected_setter) { json_value }
      end
    end

    context 'date custom field' do
      it_behaves_like 'injects property custom field' do
        let(:field_format) { 'date' }
        let(:value) { Date.today.to_date }
        let(:json_value) { value.to_date.iso8601 }
        let(:expected_setter) { json_value }
      end
    end

    context 'text custom field' do
      it_behaves_like 'injects property custom field' do
        let(:field_format) { 'text' }
        let(:value) { '**Foobar**' }
        let(:json_value) do
          {
            format: 'markdown',
            raw: value,
            html: '<p><strong>Foobar</strong></p>'
          }
        end
        let(:expected_setter) { value }
      end
    end
  end

  describe '#inject_patchable_link_value' do
    let(:base_class) { Class.new(::API::Decorators::Single) }
    let(:modified_class) do
      described_class.create_value_representer([custom_field], base_class)
    end
    let(:represented) do
      double('represented', available_custom_fields: [custom_field])
    end
    let(:custom_value) { double('CustomValue', value: value, typed_value: typed_value) }
    let(:value) { '' }
    let(:user) { FactoryBot.build_stubbed(:user) }
    let(:typed_value) { value }
    subject { modified_class.new(represented, current_user: user).to_json }

    before do
      allow(represented).to receive(:custom_value_for).with(custom_field).and_return(custom_value)
      allow(represented).to receive(:"custom_field_#{custom_field.id}").and_return(typed_value)
    end

    context 'reading' do
      let(:value) { '2' }
      let(:typed_value) { FactoryBot.build_stubbed(:user) }
      let(:field_format) { 'user' }

      it_behaves_like 'has a titled link' do
        let(:link) { cf_path }
        let(:href) { api_v3_paths.user 2 }
        let(:title) { typed_value.name }
      end

      context 'value is nil' do
        let(:value) { nil }
        let(:typed_value) { nil }

        it_behaves_like 'has an empty link' do
          let(:link) { cf_path }
        end
      end
    end

    context 'writing' do
      let(:value) { nil }
      let(:field_format) { 'user' }

      it 'accepts a valid link' 


      it 'accepts an empty link' 

    end
  end
end

