require 'spec_helper'

describe "content_pages/index.html.erb" do
  before(:each) do
    assign(:content_pages, [
      stub_model(ContentPage,
        :content_id => 1,
        :name => "Name",
        :content => "MyText"
      ),
      stub_model(ContentPage,
        :content_id => 1,
        :name => "Name",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of content_pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
