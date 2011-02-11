require 'spec_helper'

describe "parecers/show.html.erb" do
  before(:each) do
    @parecer = assign(:parecer, stub_model(Parecer,
      :codigo => 1,
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Descricao/)
  end
end
