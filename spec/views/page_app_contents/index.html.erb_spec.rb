require 'spec_helper'

describe "page_app_contents/index.html.erb" do
  before(:each) do
    assign(:page_app_contents, [
      stub_model(PageAppContent,
        :page_app_id => 1,
        :content => "MyText",
        :liked_content => "MyText"
      ),
      stub_model(PageAppContent,
        :page_app_id => 1,
        :content => "MyText",
        :liked_content => "MyText"
      )
    ])
  end

  it "renders a list of page_app_contents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
