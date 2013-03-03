require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :subject => "MyString",
      :body => "MyText",
      :user_id => 1,
      :shared => false
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_subject", :name => "task[subject]"
      assert_select "textarea#task_body", :name => "task[body]"
      assert_select "input#task_user_id", :name => "task[user_id]"
      assert_select "input#task_shared", :name => "task[shared]"
    end
  end
end
