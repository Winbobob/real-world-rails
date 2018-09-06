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

require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper.rb')

describe AddressBook::Service do
  before do
    allow(Canvas::DynamicSettings).to receive(:find).with(any_args).and_call_original
    allow(Canvas::DynamicSettings).to receive(:find).
      with("address-book", anything).
      and_return({'app-host' => 'http://test.host'})

    @sender = user_model
    @address_book = AddressBook::Service.new(@sender)
    @recipient = user_model(name: 'Bob 1')
  end

  def expand_user_ids(returns)
    returns.keys.sort_by(&:name).map(&:global_id)
  end

  def expand_common_contexts(returns)
    common_contexts = {}
    returns.each do |user,result|
      common_contexts[user.global_id] =
        case result
        when :student
          { courses: { 1 => ['StudentEnrollment'] }, groups: {} }
        when Course
          { courses: { result.global_id => ['StudentEnrollment'] }, groups: {} }
        when Group
          { courses: {}, groups: { result.global_id => ['Member'] } }
        else
          result
        end
    end
    common_contexts
  end

  def expand_cursors(returns)
    returns = returns.size.times.to_a
    if returns.size >= 3 # terminal page
      returns[-1] = nil
    end
    returns
  end

  def stub_common_contexts(args, returns={})
    args << false # ignore_result
    returns = expand_common_contexts(returns)
    allow(Services::AddressBook).to receive(:common_contexts).with(*args).and_return(returns)
  end

  def stub_known_in_context(args, compact_returns={})
    args << nil if args.length < 3 # user_ids
    args << false if args.length < 4 # ignore_result
    user_ids = expand_user_ids(compact_returns)
    common_contexts = expand_common_contexts(compact_returns)
    allow(Services::AddressBook).to receive(:known_in_context).with(*args).and_return([user_ids, common_contexts])
  end

  describe "known_users" do
    it "includes only known users" 


    it "caches the results for known users" 


    it "caches the failure for unknown users" 


    it "doesn't refetch already cached users" 


    describe "with optional :context" do
      def stub_roles_in_context(args, returns={})
        args << false # ignore_result
        returns = expand_common_contexts(returns)
        allow(Services::AddressBook).to receive(:roles_in_context).with(*args).and_return(returns)
      end

      before do
        # recipient participates in three courses, (visible without a sender)
        @course1 = course_model
        @course2 = course_model
        @course3 = course_model
        stub_roles_in_context([@course1, [@recipient.global_id]], { @recipient => @course1 })
        stub_roles_in_context([@course2, [@recipient.global_id]], { @recipient => @course2 })
        stub_roles_in_context([@course3, [@recipient.global_id]], { @recipient => @course3 })

        # but only two are shared with sender (visible with the sender)
        stub_known_in_context([@sender, @course1, [@recipient.global_id]], { @recipient => @course1 })
        stub_known_in_context([@sender, @course2, [@recipient.global_id]], { @recipient => @course2 })
        stub_known_in_context([@sender, @course3, [@recipient.global_id]], {})
        stub_common_contexts([@sender, [@recipient.global_id]], { @recipient => {
          courses: {
            @course1.global_id => ['StudentEnrollment'],
            @course2.global_id => ['StudentEnrollment']
          },
          groups: {}
        }})
      end

      it "includes all known contexts when absent" 


      it "excludes unknown contexts when absent, even if admin" 


      it "excludes other known contexts when specified" 


      it "excludes specified unknown context when sender is non-admin" 


      it "excludes specified unknown course when sender is a participant admin" 


      it "includes specified unknown context when sender is non-participant admin" 

    end

    describe "with optional :conversation_id" do
      before do
        stub_common_contexts([@sender, [@recipient.global_id]])
      end

      it "conversation_id can be passed blank" 


      it "conversation_id can be passed with garbage" 


      it "treats unknown users in that conversation as known" 


      it "ignores if sender is not a participant in the conversation" 

    end

    describe "sharding" do
      specs_require_sharding

      let(:xshard_recipient) { @shard2.activate{ user_model } }

      before do
        stub_common_contexts(
          [@sender, [xshard_recipient.global_id]],
          { xshard_recipient => :student }
        )
      end

      it "finds cross-shard known users" 


      it "works when given local ids" 

    end
  end

  describe "known_user" do
    it "returns the user if known" 


    it "returns nil if not known" 

  end

  describe "common_courses" do
    before do
      @course = course_model
      stub_common_contexts(
        [@sender, [@recipient.global_id]],
        { @recipient => @course }
      )
    end

    it "pulls the corresponding user's common_courses" 

  end

  describe "common_groups" do
    before do
      @group = group_model
      stub_common_contexts(
        [@sender, [@recipient.global_id]],
        { @recipient => @group }
      )
    end

    it "pulls the corresponding user's common_groups" 

  end

  describe "known_in_context" do
    before do
      @course = course_model
      stub_known_in_context([@sender, @course.global_asset_string], { @recipient => @course })
    end

    it "limits to users in context" 


    it "caches the results for known users" 


    it "does not cache unknown users" 


    describe "sharding" do
      specs_require_sharding

      before do
        @xshard_recipient = @shard2.activate{ user_model }
        @xshard_course = @shard2.activate{ course_model(account: Account.create) }
        stub_known_in_context([@sender, @course.global_asset_string], { @xshard_recipient => @course })
        stub_known_in_context([@sender, @xshard_course.global_asset_string], { @xshard_recipient => @xshard_course })
      end

      it "works for cross-shard courses" 


      it "finds known cross-shard users in course" 

    end
  end

  describe "search_users" do
    def stub_search_users(args, compact_returns={})
      args << false # ignore_result
      user_ids = expand_user_ids(compact_returns)
      common_contexts = expand_common_contexts(compact_returns)
      cursors = expand_cursors(compact_returns)
      returns = [user_ids, common_contexts, cursors]
      allow(Services::AddressBook).to receive(:search_users).with(*args).and_return(returns)
    end

    it "returns a paginatable collection" 


    it "defers finding matching known users to service" 


    it "passes optional :exclude_ids parameter to service" 


    it "passes optional :context parameter to service" 


    it "omits sender in service call if sender is a non-participating admin over :context" 


    it "retains sender in service call if sender is a participating admin over :context" 


    it "passes optional :weak_checks parameter to service" 


    it "passes the pager's bookmark as cursor to service" 


    it "returns a page that can give a bookmark per contained user" 


    it "uses the last user's bookmark for next page if non-nil" 


    it "returns a terminal page if the last user's bookmark is nil" 


    it "caches the results for known users when a page is materialized" 

  end

  describe "preload_users" do
    it "caches provided users" 


    it "including results with no common_contexts (made known by virtue of preload)" 

  end
end

