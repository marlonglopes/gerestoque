require 'spec_helper'

describe "grupos/edit.html.erb" do
  before(:each) do
    @grupo = assign(:grupo, stub_model(Grupo,
      :new_record? => false,
      :codigo => 1,
      :descricao => "MyString"
    ))
  end

  it "renders the edit grupo form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => grupo_path(@grupo), :method => "post" do
      assert_select "input#grupo_codigo", :name => "grupo[codigo]"
      assert_select "input#grupo_descricao", :name => "grupo[descricao]"
    end
  end
end
