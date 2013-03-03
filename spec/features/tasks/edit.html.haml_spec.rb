require 'spec_helper'

describe "tasks/edit" do

  let(:user) {FactoryGirl.create(:user)}
  let(:task) {FactoryGirl.create(:task, user: user)}
  before {sign_in user}

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path(@task), :method => "post" do
      assert_select "input#task_subject", :name => "task[subject]"
      assert_select "textarea#task_body", :name => "task[body]"

    end
  end
end
