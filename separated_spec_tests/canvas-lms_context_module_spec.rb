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

require 'nokogiri'

describe ContextModule do
  def course_module
    course_with_student_logged_in(:active_all => true)
    @module = @course.context_modules.create!(:name => "some module")
  end

  describe "index" do
    it "should require manage_content permission before showing add controls" 

  end

  it "should clear the page cache on individual tag change" 


  describe "must_contribute" do
    before do
      course_module
      @module.require_sequential_progress = true
      @module.save!
    end

    def before_after
      @module.completion_requirements = { @tag.id => { :type => 'must_contribute' } }
      @module.save!

      @progression = @module.evaluate_for(@user)
      expect(@progression).not_to be_nil
      expect(@progression).not_to be_completed
      expect(@progression).to be_unlocked
      expect(@progression.current_position).to eql(@tag.position)
      yield
      @progression = @module.evaluate_for(@user)
      expect(@progression).to be_completed
      expect(@progression.current_position).to eql(@tag.position)
    end

    it "should progress for discussions" 


    it "should progress for wiki pages" 


    it "should progress for assignment discussions" 

  end

  describe "progressing before job is run" do
    def progression_testing(progress_by_item_link)
      enable_cache do
        @is_attachment = false
        course_with_student_logged_in(:active_all => true)
        @quiz = @course.quizzes.create!(:title => "new quiz", :shuffle_answers => true)
        @quiz.publish!

        # separate timestamps so touch_context will actually invalidate caches
        Timecop.freeze(4.seconds.ago) do
          @mod1 = @course.context_modules.create!(:name => "some module")
          @mod1.require_sequential_progress = true
          @mod1.save!
          @tag1 = @mod1.add_item(:type => 'quiz', :id => @quiz.id)
          @mod1.completion_requirements = {@tag1.id => {:type => 'min_score', :min_score => 1}}
          @mod1.save!
        end

        Timecop.freeze(2.second.ago) do
          @mod2 = @course.context_modules.create!(:name => "dependant module")
          @mod2.prerequisites = "module_#{@mod1.id}"
          @mod2.save!
        end

        # all modules, tags, etc need to be published
        expect(@mod1).to be_published
        expect(@mod2).to be_published
        expect(@quiz).to be_published
        expect(@tag1).to be_published

        yield '<div id="test_content">yay!</div>'
        expect(@tag2).to be_published

        # verify the second item is locked (doesn't display)
        get @test_url
        if @test_url.match?('files')
          expect(response.status).to eq(403)
        else
          expect(response).to be_success
        end
        html = Nokogiri::HTML(response.body)
        expect(html.css('#test_content').length).to eq(@test_content_length || 0)

        # complete first module's requirements
        p1 = @mod1.evaluate_for(@student)
        expect(p1.workflow_state).to eq 'unlocked'

        @quiz_submission = @quiz.generate_submission(@student)
        Quizzes::SubmissionGrader.new(@quiz_submission).grade_submission
        @quiz_submission.workflow_state = 'complete'
        @quiz_submission.manually_scored = true
        @quiz_submission.kept_score = 1
        @quiz_submission.save!

        # navigate to the second item (forcing update to progression)
        next_link = progress_by_item_link ?
          "/courses/#{@course.id}/modules/items/#{@tag2.id}" :
          "/courses/#{@course.id}/modules/#{@mod2.id}/items/first"
        get next_link
        expect(response).to be_redirect
        expect(response.location.ends_with?(@test_url + "?module_item_id=#{@tag2.id}")).to be_truthy

        # verify the second item is accessible
        get @test_url
        expect(response).to be_success
        html = Nokogiri::HTML(response.body)
        if @is_attachment
          expect(html.at_css('#file_content')['src']).to match %r{#{@test_url}}
        elsif @is_wiki_page
          expect(html.css('#wiki_page_show').length).to eq 1
        else
          expect(html.css('#test_content').length).to eq 1
        end
      end
    end

    it "should progress to assignment" 


    it "should progress to discussion topic" 


    it "should progress to a quiz" 


    it "should progress to a wiki page" 


    it "should progress to an attachment" 

  end

  describe "caching" do
    it "should cache the view separately for each time zone" 

  end
end

