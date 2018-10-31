#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../common')

describe "site admin jobs ui" do
  include_context "in-process server selenium tests"

  module FlavorTags
    ALL = 'All'
    CURRENT = 'Current'
    FUTURE = 'Future'
    FAILED = 'Failed'
  end

  def put_on_hold(count = 2)
    validate_all_jobs_selected
    f("#hold-jobs").click
    expect(driver.switch_to.alert).not_to be_nil
    driver.switch_to.alert.accept
    wait_for_ajax_requests
    keep_trying_until do
      expect(jobs_on_hold.count).to eq count
    end

    status_cells = ff('.f2')
    status_cells.each { |status_cell| expect(status_cell.find_element(:css, 'span')).to have_class('on-hold') }
  end

  def jobs_on_hold
    @all_jobs.select do |job|
      begin
        job.reload
        job.locked_by == 'on hold'
      rescue ActiveRecord::RecordNotFound
        false
      end
    end
  end

  def validate_all_jobs_selected
    f("#select-all-jobs").click
    all_jobs = ff("#jobs-grid .slick-cell")
    all_jobs.each { |job| expect(job).to have_class('selected') }
  end

  def load_jobs_page
    get "/jobs"
    # wait for it
    f('#jobs-grid .slick-cell')
  end

  def filter_jobs(job_flavor_text)
    click_option('#jobs-flavor', job_flavor_text)
    wait_for_ajax_requests
  end

  def filter_tags(tag_flavor_text)
    click_option('#tags-flavor', tag_flavor_text)
    wait_for_ajax_requests
  end

  def future_jobs
    Delayed::Job.list_jobs(:future, nil)
  end

  before(:each) do
    site_admin_logged_in
    track_jobs do
      2.times { "present".send_later :reverse }
      "future".send_at Time.now + 30.days, :capitalize
      job = "failure".send_later_enqueue_args :downcase, no_delay: true
      @failed_job = job.fail!
    end
    @all_jobs = created_jobs.dup
    # tweak these settings to speed up the test run
    Setting.set('running_jobs_refresh_seconds', 1)
    Setting.set('job_tags_refresh_seconds', 1)
  end

  context "search" do

    it "should only action the individual job when it has been searched for" 


    it "should load handler via ajax" 


    context "all jobs" do
      before(:each) do
        load_jobs_page
      end

      it "should check current popular tags" 


      it "should check all popular tags", priority: "2" 


      it "should not action if no rows are selected" 


      it "should confirm that all current rows were selected and put on hold", priority: "2" 


      it "should confirm to put jobs on hold and unhold" 


      it "should confirm that future jobs were selected" 


      it "should confirm that failed jobs were selected" 


      it "should confirm that clicking on delete button should delete all future jobs" 

    end
  end

  context "running jobs" do
    it "should display running jobs in the workers grid" 


    it "should sort by runtime by default" 


    it "should sort dynamically" 

  end
end

