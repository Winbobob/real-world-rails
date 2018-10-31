require 'spec_helper'

describe HooksController do
  it "should route to hooks controller" 


  it "should route to hooks controller scoped under project" 

  
  it "should route to hooks controller scoped under project" 


  describe "#create" do
    before do
      @project = Factory(:project)
    end

    describe "emails" do
      it "should parse incoming emails to new conversation" 


      it "should parse incoming emails with attachments to new conversation" 

      
      it "handles encoded headers" 

      
      it "handles encoded body" 

      
      it "ignores email with missing info" 

      
      it "ignores email without plaintext part" 

      
      it "ignores email with invalid 'to' address" 


      it "should parse incoming emails with attachments to conversation answers" 


      it "should parse incoming emails with attachments to task answers" 

      
      context "the bounce system" do
        before do
          @options = post_options("#{@project.permalink}+task", 'Some subject', 'I would say something about this task')
        end
        
        it "should raise (200 for sendgrid) and create a bounce message if an unknown user posts to a project" 

        
        it "should raise (200 for sendgrid) and create a bounce message if a user does not belong to a project" 

      
        it "should raise (200 for sendgrid) and create a bounce message if a project is not found" 

        
        it "should raise (200 for sendgrid) and create a bounce message if a conversation is not found" 

        
        it "should raise (200 for sendgrid) and create a bounce message for invalid target" 

      end
      
      def check_bounce_message(options, &block)
        Emailer.should_receive(:send_with_language).with(
          :bounce_message, :en, kind_of(Array), kind_of(String)
        ).once
        
        lambda do
          yield
        end.should change(EmailBounce, :count).by(1)
      end
      
      def post_email_hook(to, subject, body, attachments = true)
        post :create, post_options(to, subject, body, attachments)
      end
      
      def post_options(to, subject, body, attachments = true)
        {
          :hook_name => 'email',
          :method => :post,
          :from => @project.user.email,
          :to => "#{to}@#{Teambox.config.smtp_settings[:domain]}",
          :text => body,
          :subject => subject,
          :attachments => attachments ? '2' : nil,
          :attachment1 => upload_file("#{Rails.root}/spec/fixtures/tb-space.jpg", 'image/jpg'),
          :attachment2 => upload_file("#{Rails.root}/spec/fixtures/teamboxdump.json", 'text/plain')
        }
      end
      
      def default_params(more = {})
        { :hook_name => 'email',
          :from => @project.user.email,
          :to => "#{@project.permalink}@#{Teambox.config.smtp_settings[:domain]}",
          :text => "Nothing to say",
          :subject => "Just testing"
        }.update(more)
      end
    end
    
    describe "Pivotal Tracker" do
      before do
        @payload_v2 = {"activity"=>
            {"author"=>"James Kirk",
            "project_id"=>26,
            "occurred_at"=>Time.parse("Mon Dec 14 22:12:09 UTC 2009"),
            "id"=>1031,
            "version"=>175,
            "description"=>'James Kirk accepted "More power to shields"',
            "event_type"=>"story_update",
            "stories"=>
              {"story"=>
                {"current_state"=>"accepted",
                "name"=>"More power to shields",
                "accepted_at"=>Time.parse("Mon Dec 14 22:12:09 UTC 2009"),
                "url"=>"https:///projects/26/stories/109",
                "id"=>109}}}}
        
        @payload_v3 = {"activity"=>
            {"author"=>"James Kirk",
            "project_id"=>26,
            "occurred_at"=>Time.parse("Mon Dec 14 22:12:09 UTC 2009"),
            "id"=>1031,
            "version"=>175,
            "description"=>'James Kirk accepted "More power to shields"',
            "event_type"=>"story_update",
            "stories"=> [
              {
                "current_state"=>"delivered",
                "url"=>"https:///projects/26/stories/109",
                "id"=>109
              }
            ]
          }}
          
        @payload_v3_new = {"activity"=>
            {"author"=>"James Kirk",
            "project_id"=>26,
            "occurred_at"=>Time.parse("Mon Dec 14 22:12:09 UTC 2009"),
            "id"=>1031,
            "version"=>175,
            "description"=>'James Kirk created "More power to shields"',
            "event_type"=>"story_update",
            "stories"=> [
              {
                "name" => "More power to shields",
                "current_state"=>"unscheduled",
                "url"=>"https:///projects/26/stories/109",
                "id"=>109
              }
            ]
          }}
      end
      
      def post(payload = @payload_v2, hook = 'pivotal')
        super :create, payload.merge(:hook_name => hook, :project_id => @project.id)
      end
      
      describe "V2" do
        it "should create a new task list" 

      
        it "should ignore unknown task statuses" 

      end
    
      describe "V3" do
        it "should raise an error when sending to V3 in this format" 

      
        it "should create a new task list" 

        
        it "should update a task if it exists" 

        
        it "should create a task on an update if it does not exist" 

      
        it "should ignore unknown task statuses" 

      end
    end
    
    describe "GitHub" do
      
      before do

        @mislav = Factory(:mislav)
        @chris = Factory(:user, {:first_name => "Chris", :last_name => "Wanstrath"})
        @frank = Factory(:user, {:email => "frank@teambox.com"})

        @project.add_user @chris
        @project.add_user @mislav
        @project.add_user @frank

        @task_list = Factory(:task_list, :project => @project, :user => @mislav)

        @task = Factory(:task, {:project => @project, :user => @mislav, :task_list => @task_list, :name => "Do something Chris"})
        @task.assign_to @chris

        @other_task = Factory(:task, {:project => @project, :user => @chris, :task_list => @task_list, :name => "Do something Mislav"})
        @other_task.assign_to @mislav

        @payload = <<-JSON
          {
            "before": "5aef35982fb2d34e9d9d4502f6ede1072793222d",
            "after": "de8251ff97ee194a289832576287d6f8ad74e3d0",
            "ref": "refs/heads/master",
            "pusher": {"email":"frank@teambox.com","name":"frank"},
            "compare": "https://github.com/teambox/teambox/compare/41a212e^...hju8251",
            "repository": {
              "url": "http://github.com/defunkt/github",
              "name": "github",
              "description": "You're lookin' at it.",
              "watchers": 5, "forks": 2, "private": 1,
              "owner": { "email": "chris@ozmm.org", "name": "defunkt" }
            },
            "commits": [
              {
                "id": "41a212ee83ca127e3c8cf465891ab7216a705f59",
                "url": "http://github.com/defunkt/github/commit/41a212ee83ca127e3c8cf465891ab7216a705f59",
                "author": { "email": "chris@ozmm.org", "name": "Chris Wanstrath" },
                "message": "Check this file, task [#{@task.id}]",
                "timestamp": "2008-02-15T14:57:17-08:00",
                "added": ["filepath.rb"]
              },
              {
                "id": "de8251ff97ee194a289832576287d6f8ad74e3d0",
                "url": "http://github.com/defunkt/github/commit/de8251ff97ee194a289832576287d6f8ad74e3d0",
                "author": { "email": "#{@mislav.email}", "name": "#{@mislav.name}" },
                "message": "Closing for task[close-#{@task.id}]",
                "timestamp": "2008-02-15T14:36:34-08:00"
              },
              {
                "id": "7gh251ff97ee194a289832576287d6f8ad74uiui6",
                "url": "http://github.com/defunkt/github/commit/7gh251ff97ee194a289832576287d6f8ad74uiui6",
                "author": { "email": "chris@ozmm.org", "name": "Chris Wanstrath" },
                "message": "Not existing task [9999]",
                "timestamp": "2008-02-15T16:39:34-08:00"
              },
              {
                "id": "hj6251i97ee19tyr28ig676F76287d6f8ag5r5Y5",
                "url": "http://github.com/defunkt/github/commit/hj6251i97ee19tyr28ig676F76287d6f8ag5r5Y5",
                "author": { "email": "chris@ozmm.org", "name": "Chris Wanstrath" },
                "message": "Forgot task id so it should appear under new conversation in old style",
                "timestamp": "2008-02-16T17:07:12-08:00"
              },
              {
                "id": "fgh251i97ee19tyr28ig676F76287d6f8ag5rghy",
                "url": "http://github.com/defunkt/github/commit/fgh251i97ee19tyr28ig676F76287d6f8ag5rghy",
                "author": { "email": "#{@mislav.email}", "name": "#{@mislav.name}" },
                "message": "Here forgot task id as well",
                "timestamp": "2008-02-16T17:09:12-08:00"
              },
              {
                "id": "hju8251ff97ee194a289832576287d6f89ui7978h",
                "url": "http://github.com/defunkt/github/commit/hju8251ff97ee194a289832576287d6f89ui7978h",
                "author": { "email": "#{@mislav.email}", "name": "#{@mislav.name}" },
                "message": "Commit for different task [#{@other_task.id}]",
                "timestamp": "2008-02-16T12:66:37-08:00"
              }
            ]
          }
        JSON
      end

      it "creates both new conversation and tasks comments when param conversations passed" 


      it "accepts hooks without commits" 


      it "post only task comments as default behaviour" 


    end
  end
end

