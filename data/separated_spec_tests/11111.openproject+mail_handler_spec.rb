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
require_relative '../legacy_spec_helper'

describe MailHandler, type: :model do
  fixtures :all

  FIXTURES_PATH = File.dirname(__FILE__) + '/../fixtures/mail_handler'

  before do
    allow(Setting).to receive(:notified_events).and_return(Redmine::Notifiable.all.map(&:name))
  end

  it 'should add work package' 


  it 'should add work package with default type' 


  it 'should add work package with status' 


  it 'should add work package with attributes override' 


  context 'with group assignment set',
          with_settings: { work_package_group_assignment: 1 } do
    it 'should add work package with group assignment' 

  end

  it 'should add work package with partial attributes override' 


  it 'should add work package with spaces between attribute and separator' 


  it 'should add work package with attachment to specific project' 


  it 'should add work package with custom fields' 


  it 'should add work package should match assignee on display name' do # added from redmine  - not sure if it is ok here
    user = FactoryBot.create(:user, firstname: 'Foo', lastname: 'Bar')
    role = FactoryBot.create(:role, name: 'Superhero')
    FactoryBot.create(:member, user: user, project: Project.find(2), role_ids: [role.id])
    issue = submit_email('ticket_on_given_project.eml') do |email|
      email.sub!(/^Assigned to.*$/, 'Assigned to: Foo Bar')
    end
    assert issue.is_a?(WorkPackage)
    assert_equal user, issue.assigned_to
  end

  it 'should add work package with cc' 


  it 'should add work package by unknown user' 


  it 'should add work package by anonymous user' 


  it 'should add work package by anonymous user with no from address' 


  it 'should add work package by anonymous user on private project' 


  it 'should add work package by anonymous user on private project without permission check' 


  it 'should add work package without from header' 


  it 'should add work package with invalid attributes' 


  it 'should add work package with localized attributes' 


  it 'should add work package with japanese keywords' 


  it 'should add from apple mail' 


  it 'should add work package with iso 8859 1 subject' 


  it 'should ignore emails from locked users' 


  it 'should ignore emails from emission address' 


  it 'should ignore auto replied emails' 


  it 'should add work package should send email notification' 


  it 'should add work package note' 


  specify 'reply to issue update (Journal) by message_id' do
    Journal.delete_all
    issue = WorkPackage.find(2)
    j = FactoryBot.create :work_package_journal, id: 3, journable_id: issue.id
    journal = submit_email('ticket_reply_by_message_id.eml')
    assert journal.data.is_a?(Journal::WorkPackageJournal), "Email was a #{journal.data.class}"
    assert_equal User.find_by_login('jsmith'), journal.user
    assert_equal WorkPackage.find(2), journal.journable
    assert_match /This is reply/, journal.notes
    assert_equal 'Feature request', journal.journable.type.name
  end

  it 'should add work package note with attribute changes' 


  it 'should add work package note should send email notification' 


  it 'should add work package note should not set defaults' 


  it 'should reply to a message' 


  it 'should reply to a message by subject' 


  it 'should strip tags of html only emails' 


  context 'truncate emails based on the Setting' do
    context 'with no setting' do
      before do
        Setting.mail_handler_body_delimiters = ''
      end

      it 'should add the entire email into the issue' 

    end

    context 'with a single string' do
      before do
        Setting.mail_handler_body_delimiters = '---'
      end

      it 'should truncate the email at the delimiter for the issue' 

    end

    context 'with a single quoted reply (e.g. reply to a Redmine email notification)' do
      before do
        Setting.mail_handler_body_delimiters = '--- Reply above. Do not remove this line. ---'
      end

      it 'should truncate the email at the delimiter with the quoted reply symbols (>)' 

    end

    context 'with multiple quoted replies (e.g. reply to a reply of a Redmine email notification)' do
      before do
        Setting.mail_handler_body_delimiters = '--- Reply above. Do not remove this line. ---'
      end

      it 'should truncate the email at the delimiter with the quoted reply symbols (>)' 

    end

    context 'with multiple strings' do
      before do
        Setting.mail_handler_body_delimiters = "---\nBREAK"
      end

      it 'should truncate the email at the first delimiter found (BREAK)' 

    end
  end

  it 'should email with long subject line' 


  it 'should new user from attributes should return valid user' 


  context 'with min password length',
          with_settings: { password_min_length: 15 } do
    it 'should new user from attributes should respect minimum password length' 

  end

  it 'should new user from attributes should use default login if invalid' 


  it 'should new user with utf8 encoded fullname should be decoded' 


  private

  def submit_email(filename, options = {})
    raw = IO.read(File.join(FIXTURES_PATH, filename))
    yield raw if block_given?
    MailHandler.receive(raw, options)
  end

  def assert_issue_created(issue)
    assert issue.is_a?(WorkPackage)
    assert !issue.new_record?
    issue.reload
  end
end

