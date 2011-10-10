require 'spec_helper'

describe "content_pages/edit.html.erb" do
  before(:each) do
    @content_page = assign(:content_page, stub_model(ContentPage,
      :content_id => 1,
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit content_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => content_pages_path(@content_page), :method => "post" do
      assert_select "input#content_page_content_id", :name => "content_page[content_id]"
      assert_select "input#content_page_name", :name => "content_page[name]"
      assert_select "textarea#content_page_content", :name => "content_page[content]"
    end
  end
end
