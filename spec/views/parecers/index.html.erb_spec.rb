require 'spec_helper'

describe "parecers/index.html.erb" do
  before(:each) do
    assign(:parecers, [
      stub_model(Parecer,
        :codigo => 1,
        :descricao => "Descricao"
      ),
      stub_model(Parecer,
        :codigo => 1,
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of parecers" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
