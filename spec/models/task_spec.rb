require 'spec_helper'

describe Task do

  let(:user) {FactoryGirl.create(:user)}

  before do
    @task = user.tasks.build(subject: 'Test subject', body: 'Test task body')
  end

  subject {@task}

  it { should respond_to(:subject) }
  it { should respond_to(:shared) }
  it { should respond_to(:body) }
  it { should respond_to(:editor_ids) }
  it { should respond_to(:user_id) }

  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Task.new(user_id: "1")
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it "should not allow access to shared" do
      expect do
        Task.new(shared: true)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

  end

  describe "when user_id is not present" do
    before { @task.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank subject" do
    before { @task.subject = " " }
    it { should_not be_valid }
  end

  describe "saving without editor_ids" do
    before do
      @task.editor_ids = nil
      @task.save
    end
    it {should_not be_shared}
  end


  describe "saving with editor_ids" do
    let(:editor) {FactoryGirl.create(:user)}
    before do
      @task.editor_ids = [editor.id]
      @task.save
    end
    it {should be_shared}
    its(:editors) {should include(editor)}
  end

end
