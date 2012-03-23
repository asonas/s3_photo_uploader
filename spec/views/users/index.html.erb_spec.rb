require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :photo_key => "Photo Key"
      ),
      stub_model(User,
        :name => "Name",
        :photo_key => "Photo Key"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Photo Key".to_s, :count => 2
  end
end
