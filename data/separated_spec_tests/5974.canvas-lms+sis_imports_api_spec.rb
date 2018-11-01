#
# Copyright (C) 2011 - 2014 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe SisImportsApiController, type: :request do
  before :once do
    @user = user_with_pseudonym :active_all => true
    @account = Account.default
    @account.allow_sis_import = true
    @account.save
    @account.account_users.create!(user: @user)
    Account.site_admin.account_users.create!(user: @user)

    @user_count = User.count
    @batch_count = SisBatch.count
  end

  def post_csv(*lines_or_opts)
    lines = lines_or_opts.reject{|thing| thing.is_a? Hash}
    opts = lines_or_opts.select{|thing| thing.is_a? Hash}.inject({}, :merge)

    tmp = Tempfile.new("sis_rspec")
    path = "#{tmp.path}.csv"
    tmp.close!
    File.open(path, "w+") { |f| f.puts lines.flatten.join "\n" }

    json = api_call(:post,
        "/api/v1/accounts/#{@account.id}/sis_imports.json",
        { :controller => "sis_imports_api", :action => "create",
          :format => "json", :account_id => @account.id.to_s },
        opts.merge({ :import_type => "instructure_csv",
          :attachment => Rack::Test::UploadedFile.new(path)}))
    expect(json.has_key?("created_at")).to be_truthy
    json.delete("created_at")
    expect(json.has_key?("updated_at")).to be_truthy
    json.delete("updated_at")
    expect(json.has_key?("ended_at")).to be_truthy
    json.delete("ended_at")
    expect(json.has_key?("started_at")).to eq true
    json.delete("started_at")
    if opts[:batch_mode_term_id]
      expect(json["batch_mode_term_id"]).not_to be_nil
    end
    json.delete("batch_mode_term_id")
    json.delete("user")
    batch = SisBatch.last
    expect(json).to eq({
          "data" => { "import_type"=>"instructure_csv"},
          "progress" => 0,
          "id" => batch.id,
          "workflow_state"=>"created",
          "batch_mode" => opts[:batch_mode] ? true : nil,
          "override_sis_stickiness" => opts[:override_sis_stickiness] ? true : nil,
          "add_sis_stickiness" => opts[:add_sis_stickiness] ? true : nil,
          "clear_sis_stickiness" => opts[:clear_sis_stickiness] ? true : nil,
          "multi_term_batch_mode" => nil,
          "diffing_data_set_identifier" => nil,
          "diffed_against_import_id" => nil,
          "diffing_drop_status" => nil,
          "skip_deletes" => false,
          "change_threshold" => nil,
    })
    batch.process_without_send_later
    run_jobs
    return batch.reload
  end

  it 'should kick off a sis import via multipart attachment' 


  it 'should restore batch on restore_states and return progress' 


  it 'should show current running sis import' 


  it 'should abort batch on abort' 


  it 'should allow aborting an importing batch' 


  it 'should not explode if there is no batch' 


  it 'should abort all pending batches on abort' 


  it "should skip the job for skip_sis_jobs_account_ids" 


  it "should enable batch mode and require selecting a valid term" 


  it "should use change threshold for batch mode" 


  it "should requre change threshold for multi_term_batch_mode" 


  it "should use multi_term_batch_mode" 


  it "should enable batch with sis stickyness" 


  it "should enable diffing mode" 


  it "should error for invalid diffing_drop_status" 


  it "should error if batch mode and the term can't be found" 


  it "should enable sis stickiness options" 


  it 'should support sis stickiness overriding' 


  it 'should allow turning on stickiness' 


  it 'should allow turning off stickiness' 


  it "should allow raw post without content-type" 


  it "should allow raw post without charset" 


  it "should handle raw post content-types with attributes" 


  it "should reject non-utf-8 encodings on content-type" 


  it "should list sis imports for an account" 


  it "should return downloadable attachments if available" 


  it "should filter sis imports by date if requested" 


  it "should not fail when options are nil" 


  it "should error on non-root account" 


  it "should error on non-enabled root account" 


  it "should error on user with no sis permissions" 


  it "should work with import permissions" 


  it "should include the errors_attachment when there are errors" 

end

