require 'spec_helper'

describe "page_app_contents/show.html.erb" do
  before(:each) do
    @page_app_content = assign(:page_app_content, stub_model(PageAppContent,
      :page_app_id => 1,
      :content => "MyText",
      :liked_content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
