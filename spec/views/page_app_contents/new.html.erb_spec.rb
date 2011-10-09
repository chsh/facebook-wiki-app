require 'spec_helper'

describe "page_app_contents/new.html.erb" do
  before(:each) do
    assign(:page_app_content, stub_model(PageAppContent,
      :page_app_id => 1,
      :content => "MyText",
      :liked_content => "MyText"
    ).as_new_record)
  end

  it "renders new page_app_content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => page_app_contents_path, :method => "post" do
      assert_select "input#page_app_content_page_app_id", :name => "page_app_content[page_app_id]"
      assert_select "textarea#page_app_content_content", :name => "page_app_content[content]"
      assert_select "textarea#page_app_content_liked_content", :name => "page_app_content[liked_content]"
    end
  end
end
