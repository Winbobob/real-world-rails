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

describe ::API::Utilities::ResourceLinkParser do
  subject { described_class }

  describe '#parse' do
    shared_examples_for 'accepts resource link' do
      it 'parses the version' 


      it 'parses the namespace' 


      it 'parses the id' 

    end

    shared_examples_for 'rejects resource link' do
      it 'is nil' 

    end

    describe 'generic resource links' do
      describe 'accepts a simple resource' do
        it_behaves_like 'accepts resource link' do
          let(:result) { subject.parse '/api/v3/statuses/12' }
          let(:version) { '3' }
          let(:namespace) { 'statuses' }
          let(:id) { '12' }
        end
      end

      describe 'accepts and parses all valid segment characters as id' do
        it_behaves_like 'accepts resource link' do
          let(:result) { subject.parse '/api/v3/string_object/foo-2_~!$&\'()*+.,:;=@%40' }
          let(:version) { '3' }
          let(:namespace) { 'string_object' }
          let(:id) { 'foo-2_~!$&\'()*+.,:;=@@' }
        end
      end

      describe 'rejects resources with empty id segment' do
        it_behaves_like 'rejects resource link' do
          let(:result) { subject.parse '/api/v3/statuses/' }
        end
      end

      describe 'rejects resource with missing id segment' do
        it_behaves_like 'rejects resource link' do
          let(:result) { subject.parse '/api/v3/statuses' }
        end
      end

      describe 'rejects the api root' do
        it_behaves_like 'rejects resource link' do
          let(:result) { subject.parse '/api/v3/' }
        end
      end

      describe 'rejects nested resources' do
        it_behaves_like 'rejects resource link' do
          let(:result) { subject.parse '/api/v3/statuses/imaginary/' }
        end
      end
    end

    describe 'string object resource' do
      describe 'accepts a simple string' do
        it_behaves_like 'accepts resource link' do
          let(:result) { subject.parse '/api/v3/string_objects/foobar' }
          let(:version) { '3' }
          let(:namespace) { 'string_objects' }
          let(:id) { 'foobar' }
        end
      end

      describe 'accepts and parses all valid segment characters as value' do
        it_behaves_like 'accepts resource link' do
          let(:result) { subject.parse '/api/v3/string_objects?value=foo-2_~!$&\'()*+.,:;=@%40' }
          let(:version) { '3' }
          let(:namespace) { 'string_objects' }
          let(:id) { 'foo' }
        end
      end

      describe 'accepts string objects with empty value parameter' do
        it_behaves_like 'accepts resource link' do
          let(:result) { subject.parse '/api/v3/string_objects?value=' }
          let(:version) { '3' }
          let(:namespace) { 'string_objects' }
          let(:id) { '' }
        end
      end

      describe 'rejects resource with missing value parameter' do
        it_behaves_like 'rejects resource link' do
          let(:result) { subject.parse '/api/v3/string_objects' }
        end
      end
    end
  end

  describe '#parse_id' do
    it 'parses the id' 


    it 'parses an empty value as empty string' 


    it 'accepts on matching version' 


    it 'accepts on matching version as integer' 


    it 'accepts on matching namespace' 


    it 'accepts on matching namespace as symbol' 


    it 'raises on version mismatch' 


    it 'raises on namespace mismatch' 


    it 'contains the property name in exception messages' 

  end
end

