require "audit_history"

describe AuditHistory do
end

describe AuditChange do
  context "with associations" do
    let(:change) { ["project_id", [3, 4]] }
    let(:audit_change) { AuditChange::Update.new(change) }
    let(:project) { double(:project) }

    it "#from" 


    it "#to" 


    it "#property" 


    it "#destroyed?" 

  end

  context "remove association" do
    let(:change) { ["client_id", [1,nil]] }
    let(:audit_change) { AuditChange::Update.new(change) }

    it "to_string" 


    it "#destroyed?" 

  end

  context "with values" do
    let(:change) { ["description", ["Foo", "Bar"]] }
    let(:audit_change) { AuditChange::Update.new(change) }

    it "#from" 


    it "#to" 


    it "#property" 

  end
end

