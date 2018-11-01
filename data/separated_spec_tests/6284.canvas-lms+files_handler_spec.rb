#
# Copyright (C) 2016 - present Instructure, Inc.
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
#

require 'spec_helper'

describe UserContent::FilesHandler do
  let(:is_public) { false }
  let(:in_app) { false }
  let(:attachment) do
    attachment_with_context(course_factory(active_all:true), {
      filename: 'test.mp4',
      content_type: 'video'
    })
  end
  let(:match_url) do
    [
      attachment.context_type.tableize,
      attachment.context_id,
      'files',
      match_part
    ].join('/')
  end
  let(:match_part) { 'download?wrap=1' }
  let(:uri_match) do
    UserContent::FilesHandler::UriMatch.new(OpenStruct.new({
      url: match_url,
      type: 'files',
      obj_class: Attachment,
      obj_id: attachment.id,
      rest: "/#{match_part}"
    }))
  end

  describe UserContent::FilesHandler::ProcessedUrl do
    subject(:processed_url) do
      UserContent::FilesHandler::ProcessedUrl.new(
        match: uri_match,
        attachment: attachment,
        is_public: is_public,
        in_app: in_app
      ).url
    end

    describe '#url' do
      it 'includes context class' 


      it 'includes wrap=1' 


      it 'includes verifier query param' 


      context 'is in_app' do
        let(:in_app) { true }

        it 'does not include verifier' 

      end

      context 'and match is a preview' do
        let(:match_part) { 'preview' }

        it 'is a preview url' 


        it 'does not include wrap param' 

      end

      context 'when attachment does not support relative paths' do
        let(:attachment) { attachment_with_context(submission_model) }

        it 'should not include context name' 

      end
    end
  end

  describe UserContent::FilesHandler do
    subject(:processed_url) do
      UserContent::FilesHandler.new(
        match: uri_match,
        context: attachment.context,
        user: current_user,
        preloaded_attachments: preloaded_attachments,
        is_public: is_public,
        in_app: in_app
      ).processed_url
    end
    let(:current_user) do
      student_in_course(active_all: true, course: attachment.context)
      @student
    end
    let(:preloaded_attachments) { {} }

    describe '#processed_url' do
      it 'delegates to ProcessedUrl' 


      context 'user does not have download rights' do
        let(:current_user) { user_factory }

        it 'returns match_url with preview=1' 


        context 'but attachment is public' do
          let(:is_public) { true }

          it 'delegates to ProcessedUrl' 

        end
      end
    end
  end
end

