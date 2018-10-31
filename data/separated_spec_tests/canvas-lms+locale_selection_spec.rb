#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LocaleSelection do
  class TestClassForMixins
    extend LocaleSelection
  end

  def ls
    TestClassForMixins
  end

  context 'accept-language' do
    it "should ignore malformed accept-language headers" 


    it "should match valid locale ranges" 


    it "should not match invalid locale ranges" 


    it "should do case-insensitive matching" 


    # see rfc2616 ... en means any en(-.*)? is acceptable
    it "should do range prefix-matching" 


    # while tag prefix-matching might be desirable (sometimes), it should not
    # be done automatically on the server-side (though the user-agent can do
    # it). from the rfc:
    #   [U]sers might [incorrectly] assume that on selecting "en-gb", they
    #   will be served any kind of English document if British English is not
    #   available. A user agent might suggest in such a case to add "en" to
    #   get the best matching behavior.
    it "should not do tag prefix-matching" 


    it "should assign quality values based on the best match" 


    it "should understand wildcards" 


    it "handles aliases" 

  end

  context "locale matching" do
    before do
      allow(I18n.config).to receive(:available_locales).and_return([:en, :it, :es, :fr, :de, :pt, :zh])
      I18n.config.clear_available_locales_set
      @root_account = Account.create
      @account = Account.create(:parent_account => @root_account)
      user_factory
      course_factory
      @course.account = @account
      @course.save
    end

    after do
      I18n.config.clear_available_locales_set
    end

    it "should use the default locale if there is no other context" 


    it "should infer the locale from the accept_language" 


    it "should infer the locale from the root account" 


    it "should infer the locale from the account" 


    it "should infer the locale from the user" 


    it "should ignore bogus locales" 


    it "should infer the locale from the course" 


    it "should infer the locale of a group from the group's context" 


    it "should infer the locale from the session" 

  end

  describe "available_locales" do
    it "does not include custom locales" 

  end
end

