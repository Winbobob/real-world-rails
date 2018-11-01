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

describe UserMailer, type: :mailer do
  include ::Rails::Dom::Testing::Assertions::SelectorAssertions

  before do
    Setting.mail_from = 'john@doe.com'
    Setting.host_name = 'mydomain.foo'
    Setting.protocol = 'http'
    Setting.plain_text_mail = '0'
    Setting.default_language = 'en'

    User.delete_all
    WorkPackage.delete_all
    Project.delete_all
    ::Type.delete_all
  end

  it 'should test mail sends a simple greeting' 


  it 'should generated links in emails' 


  context 'with prefix', with_config: { rails_relative_url_root: '/rdm' } do
    it 'should generated links with prefix and relative url root' 

  end

  it 'should email headers' 


  it 'sends plain text mail' 


  it 'sends html mail' 


  context 'with mail_from set', with_settings: { mail_from: 'Redmine app <redmine@example.net>' } do
    it 'should mail from with phrase' 

  end

  it 'should not send email without recipient' 


  it 'should issue add message id' 


  it 'should work package updated message id' 


  it 'should message posted message id' 


  it 'should reply posted message id' 


  context '#issue_add',
          with_settings: { available_languages: ['en', 'de'], default_language: 'de' } do
    it 'should change mail language depending on recipient language' 


    it 'should falls back to default language if user has no language' 

  end

  it 'should news added' 


  it 'should news comment added' 


  it 'should message posted' 


  it 'should account information' 


  it 'should lost password' 


  it 'should register' 


  it 'should reminders' 


  it 'should reminders for users' 


  context 'with locale settings',
          with_settings: { available_languages: ['en', 'de'], default_language: 'de' } do
    it 'should mailer should not change locale' 

  end

  it 'should with deliveries off' 


  context 'layout',
          with_settings: {
            available_languages: [:en, :de],
            localized_emails_header: 'deutscher header'
          } do
    it 'should include the emails_header depeding on the locale' 

  end

  private

  def last_email
    mail = ActionMailer::Base.deliveries.last
    refute_nil mail
    mail
  end

  def setup_complex_issue_update
    project = FactoryBot.create(:valid_project)
    user    = FactoryBot.create(:admin, member_in_project: project)
    type = FactoryBot.create(:type, name: 'My Type')
    project.types << type
    project.save

    related_issue = FactoryBot.create(:work_package,
                                       subject: 'My related Ticket',
                                       type: type,
                                       project: project)

    issue = FactoryBot.create(:work_package,
                               subject: 'My awesome Ticket',
                               type: type,
                               project: project,
                               description: 'nothing here yet')

    # now change the issue, to get a nice journal
    issue.description = "This is related to issue ##{related_issue.id}\n"

    repository = FactoryBot.create(:repository_subversion,
                                    project: project)

    changeset = FactoryBot.create :changeset,
                                   repository: repository,
                                   comments: 'This commit fixes #1, #2 and references #1 and #3'

    issue.description += " A reference to a changeset r#{changeset.revision}\n" if changeset

    attachment = FactoryBot.build(:attachment,
                                   author: issue.author)

    issue.attachments << attachment

    issue.description += " A reference to an attachment attachment:#{attachment.filename}"

    assert issue.save
    issue.reload
    journal = issue.journals.last

    ActionMailer::Base.deliveries = [] # remove issue-created mails

    [project, user, related_issue, issue, changeset, attachment, journal]
  end

  def url_for(options)
    options.merge!(host: Setting.host_name, protocol: Setting.protocol)
    Rails.application.routes.url_helpers.url_for options
  end
end

