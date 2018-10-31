require 'spec_helper'
require 'rake'

describe HealthController, type: :controller do
  describe "Hitting the health endpoint of Earthdata Search" do
    before :all do
      @delayed_job = DelayedJob.new
      @delayed_job.run_at = Time.now
      @delayed_job.created_at = Time.now
      @delayed_job.handler = 'test'

      @retrieval = Retrieval.new
      @retrieval.created_at = Time.now - 1.minute
    end

    # before :each do
    #   Dir.glob(Rails.root.join('tmp', "data_load_*")).each { |f| File.delete(f) }
    #   Dir.glob(Rails.root.join('tmp', "colormaps_load_*")).each { |f| File.delete(f) }
    #
    #   FileUtils.touch Rails.root.join('tmp', "data_load_#{Time.now.to_i}")
    #   FileUtils.touch Rails.root.join('tmp', "colormaps_load_#{Time.now.to_i}")
    #   allow(File).to receive(:ctime).with(Rails.root.join('README.md')).and_return(Time.now - 5.days)
    # end
    #
    # after :each do
    #   Dir.glob(Rails.root.join('tmp', "data_load_*")).each { |f| File.delete(f) }
    #   Dir.glob(Rails.root.join('tmp', "colormaps_load_*")).each { |f| File.delete(f) }
    # end

    context "when everything is up" do
      before :all do
        CronJobHistory.new(task_name: 'data:load:echo10', last_run: Time.now - 1.minute, status: 'succeeded', host: 'host1').save!
        CronJobHistory.new(task_name: 'data:load:granules', last_run: Time.now - 1.minute, status: 'succeeded', host: 'host1').save!
        CronJobHistory.new(task_name: 'data:load:tags', last_run: Time.now - 1.minute, status: 'succeeded', host: 'host1').save!
        CronJobHistory.new(task_name: 'colormaps:load', last_run: Time.now - 1.minute, status: 'succeeded', host: 'host1').save!
      end

      after :all do
        CronJobHistory.delete_all
      end

      it "returns a json response indicating the system is ok" 

    end

    context "when one of the dependencies is down" do
      before :all do
        CronJobHistory.new(task_name: 'data:load:echo10', last_run: Time.now - 1.minute, status: 'succeeded', host: 'host1').save!
        CronJobHistory.new(task_name: 'data:load:granules', last_run: Time.now - 1.minute, status: 'succeeded', host: 'host1').save!
        CronJobHistory.new(task_name: 'data:load:tags', last_run: Time.now - 1.minute, status: 'succeeded', host: 'host1').save!
        CronJobHistory.new(task_name: 'colormaps:load', last_run: Time.now - 1.minute, status: 'succeeded', host: 'host1').save!
      end

      after :all do
        CronJobHistory.delete_all
      end

      it "returns a json response indicating edsc is not ok" 

    end

    context "when the SSL Certificate held by URS fails" do
      it "recovers from the exception and reports the failure" 

    end

    context "when one of the dependencies is down and the connection times out (nil body returns)" do
      before :all do
        CronJobHistory.new(task_name: 'data:load:echo10', last_run: Time.now - 1.minute, status: 'succeeded', host: 'host1').save!
        CronJobHistory.new(task_name: 'data:load:granules', last_run: Time.now - 1.minute, status: 'succeeded', host: 'host1').save!
        CronJobHistory.new(task_name: 'data:load:tags', last_run: Time.now - 1.minute, status: 'succeeded', host: 'host1').save!
        CronJobHistory.new(task_name: 'colormaps:load', last_run: Time.now - 1.minute, status: 'succeeded', host: 'host1').save!
      end

      after :all do
        CronJobHistory.delete_all
      end

      it "returns a json response indicating edsc is not ok" 

    end

    context "when one of the cron job hasn't been run for a while" do
      before :all do
        CronJobHistory.new(task_name: 'data:load:echo10', last_run: Time.now - 4.hours, status: 'succeeded', host: 'host1').save!
      end

      after :all do
        CronJobHistory.delete_all
      end

      it "returns a json response indicating edsc is not ok" 

    end

    context "when one of the cron job failed with an error" do
      before :all do
        CronJobHistory.new(task_name: 'data:load:echo10', last_run: Time.now, status: 'failed', message: 'error text', host: 'host1').save!
      end

      after :all do
        CronJobHistory.delete_all
      end

      it "returns a json response indicating edsc is not ok with the error message" 

    end
  end

end

