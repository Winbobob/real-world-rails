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
require 'spec_helper.rb'
require_dependency 'services/submit_homework_service'

module Services
  describe SubmitHomeworkService do
    subject { described_class.new(attachment, assignment) }

    let(:user) { user_factory }
    let(:assignment) { assignment_model }
    let(:attachment) do
      attachment_model(
        context: assignment,
        user: user,
        filename: 'Some File'
      )
    end
    let(:submitted_at) { Time.zone.now }
    let(:failure_email) do
      OpenStruct.new(
        from_name: 'notifications@instructure.com',
        subject: "Submission upload failed: #{assignment.name}",
        to: user.email,
        body: "Your file, #{attachment.display_name}, failed to upload to your "\
              "Canvas assignment, #{assignment.name}. Please re-submit to "\
              "the assignment or contact your instructor if you are no "\
              "longer able to do so."
      )
    end
    let(:eula_agreement_timestamp) { "1522419910" }
    let(:url) { 'url' }
    let(:dup_handling) { false }
    let(:check_quota) { false }
    let(:opts) { { fancy: 'very' } }
    let(:executor) do
      described_class.create_clone_url_executor(url, dup_handling, check_quota, opts)
    end

    describe '.create_clone_url_executor' do
      it 'should set the url' 


      it 'should set the duplicate_handling' 


      it 'should set the check_quota' 


      it 'should set the opts' 

    end

    describe '.submit_job' do
      let(:service) { described_class.new(attachment, assignment)}
      let(:progress) { Progress.create(context: assignment, tag: 'test') }
      let!(:worker) { described_class.submit_job(progress, attachment, eula_agreement_timestamp, executor) }

      before { allow(described_class).to receive(:new).and_return(service) }

      it 'should clone and submit the url' 


      context 'on an error' do
        before { worker.on_permanent_failure("error") }

        it 'marks progress as failed' 


        it 'sends a failure email' 

      end

      context 'queues up a delayed job' do
        let(:worker_job) { Delayed::Job.order(:id).last }

        it 'enqueues the worker job' 

      end
    end

    describe '#submit' do
      let(:submission) { subject.submit(submitted_at, eula_agreement_timestamp) }
      let(:recent_assignment) { assignment.reload }

      it 'should set submitted_at to the Progress#created_at' 


      it 'should set attachments for the submission' 


      it 'should set assignment for the submission' 

    end

    context 'sending an email' do
      let(:email_job) { Delayed::Job.last }

      describe '#failure_email' do
        it 'enqueues a failure email' 

      end
    end
  end
end

