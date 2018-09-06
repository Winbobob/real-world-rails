#
# Copyright (C) 2014 - present Instructure, Inc.
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

describe ProgressSerializer do
  let(:context) { Account.default }

  let :progress do
    p = context.progresses.build
    p.id = 1
    p.completion = 10
    p.workflow_state = 'running'
    p.save
    p
  end

  let(:host_name) { 'example.com' }

  let :controller do
    options = {
      accepts_jsonapi: true,
      stringify_json_ids: true
    }

    ActiveModel::FakeController.new(options).tap do |controller|
      allow(controller).to receive(:session).and_return Object.new
      allow(controller).to receive(:context).and_return Object.new
    end
  end

  subject do
    ProgressSerializer.new(progress, {
      controller: controller,
      scope: User.new
    })
  end

  let :json do
    @json ||= subject.as_json[:progress].stringify_keys
  end

  [
    :context_type, :user_id, :tag, :completion, :workflow_state, :created_at,
    :updated_at, :message
  ].map(&:to_s).each do |key|
    it "serializes #{key}" 

  end

  it 'serializes id' 


  it 'serializes url' 

end

