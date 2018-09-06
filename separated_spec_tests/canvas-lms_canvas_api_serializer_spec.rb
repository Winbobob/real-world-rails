#
# Copyright (C) 2013 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.

require 'spec_helper'

describe Canvas::APISerializer do

  let(:controller) { ActiveModel::FakeController.new }
  let(:options) { { scope: {}, controller: controller } }
  let(:serializer) { Canvas::APISerializer.new({}, options) }

  it "aliases user to options[:scope]" 


  it "aliases current_user to user" 


  [:stringify_json_ids?, :accepts_jsonapi?, :session, :context].each do |method|

    it "delegates #{method} to controller" 

  end

  it "creates an alias for object based on serializer class name" 


  describe "#serializable object" do
    before do

      Foo = Struct.new(:id, :name) do
        def read_attribute_for_serialization(attr)
          send(attr)
        end
      end

      class FooSerializer < Canvas::APISerializer
        attributes :id, :name
      end
    end

    after do
      Object.send(:remove_const, :Foo)
      Object.send(:remove_const, :FooSerializer)
    end

    it "uses ActiveModel::serializer's implementation if not stringify_ids? returns false" 


    it "stringifies ids if jsonapi or stringids requested" 


    it "uses urls for embed: :ids, include: false" 


    it "uses ids for embed: :ids, embed_in_root: true" 


    context 'embedding objects in root' do
      before do
        Bar = Struct.new(:id, :name) do
          def read_attribute_for_serialization(attr)
            send(attr)
          end
        end

        class BarSerializer < Canvas::APISerializer
          attributes :id, :name
        end
      end

      after do
        Object.send(:remove_const, :Bar)
        Object.send(:remove_const, :BarSerializer)
      end

      let :object do
        Foo.new(1, 'Bob').tap do |object|
          expect(object).to receive(:bar).and_return Bar.new(1, 'Alice')
        end
      end

      let :controller do
        ActiveModel::FakeController.new({
          accepts_jsonapi: true,
          stringify_json_ids: true
        })
      end

      subject do
        FooSerializer.new(object, {
          controller: controller,
          root: nil
        })
      end

      it "uses objects for embed: :object, embed_in_root: true" 


      it "uses objects for embed: :object, embed_in_root: true and uses a custom key" 


      it "respects the :wrap_in_array custom option" 

    end
  end
end

