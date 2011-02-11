require 'spec_helper'

describe "parecers/edit.html.erb" do
  before(:each) do
    @parecer = assign(:parecer, stub_model(Parecer,
      :new_record? => false,
      :codigo => 1,
      :descricao => "MyString"
    ))
  end

  it "renders the edit parecer form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => parecer_path(@parecer), :method => "post" do
      assert_select "input#parecer_codigo", :name => "parecer[codigo]"
      assert_select "input#parecer_descricao", :name => "parecer[descricao]"
    end
  end
end
