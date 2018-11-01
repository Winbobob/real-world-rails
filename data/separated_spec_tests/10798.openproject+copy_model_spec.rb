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

describe 'Copying Models' do
  let(:dummy_class) do
    Class.new do
      include CopyModel

      attr_accessor :call_order

      copy_precedence([:association2, :association1])

      attr_accessor :association1,
                    :association2,
                    :association3

      def attributes
        { 'attribute1' => 'attribute1',
          'attribute2' => 'attribute2' }
      end

      def attributes=(_)
      end

      def self.reflect_on_all_associations
        [OpenStruct.new(name: 'association1', valid?: true),
         OpenStruct.new(name: 'association2', valid?: true),
         OpenStruct.new(name: 'association3', valid?: true)]
      end

      def copy_association1(other, selected_copies = [])
        call_order << :association1
        self.association1 = other.association1
      end

      def copy_association2(other, selected_copies = [])
        call_order << :association2
        self.association2 = other.association2
      end

      # used to test error handling
      def copy_relation5(_other)
        raise 'Could not be copied!'
      end

      def call_order
        @call_order ||= []
      end

      def save
        true
      end

      def reload
        true
      end

      def errors
        @errors ||= begin
          Class.new(Array) do
            def add(attribute, value)
              push(attribute: attribute, value: value)
            end
          end.new
        end
      end
    end
  end

  let(:attributes) do
    { 'attribute1' => 'attribute1',
      'attribute2' => 'attribute2' }
  end
  let(:dummy) {
    dummy_class.new
  }
  let(:copied) {
    copied = dummy_class.new
    allow(dummy_class)
      .to receive(:new)
      .and_return(copied)

    copied
  }

  before do
    expect(dummy_class)
      .to receive(:transaction)
      .and_yield
  end

  describe 'copying attributes' do
    it 'should copy safe attributes' 


    it 'should not copy attributes flagged by not_to_copy' 

  end

  describe 'copying associations' do
    let(:copy) { dummy_class.copy(dummy) }
    let(:association1_value) { double('association1_value', valid?: true) }
    let(:association2_value) { double('association2_value', valid?: true) }
    let(:association3_value) { double('association3_value', valid?: true) }

    before do
      dummy.association1 = association1_value
      dummy.association2 = association2_value
      dummy.association3 = association3_value
    end

    it 'should copy associations, for which there are methods in our model' 


    it 'should not copy associations, for which there are no methods in our model' 


    it 'should copy stuff within order (ordered by #copy_precedence)' 


    it 'should produce some errors when failing to copy associations' 

  end
end

