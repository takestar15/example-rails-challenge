require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    c1, c2, c3, c4 = create_list(:customer, 4)

    create_list(:charge, 5, :paid, customer: c1)
    create_list(:charge, 3, :paid, customer: c2)
    create_list(:charge, 1, :paid, customer: c3)
    create_list(:charge, 1, :paid, customer: c4)
    create_list(:charge, 3, :failed, customer: c3)
    create_list(:charge, 2, :failed, customer: c4)
    create_list(:charge, 3, :refunded, customer: c3)
    create_list(:charge, 2, :refunded, customer: c4)

    assign(:charges, Charge.all)
  end

  it "renders a list of charges" do
    render

    expect(rendered).to have_selector('h1', count: 3)

    expect(rendered).to have_selector('h1', text: 'Failed Charges', count: 1)
    expect(rendered).to have_selector('table.failed tbody tr', count: 5)

    expect(rendered).to have_selector('h1', text: 'Disputed Charges', count: 1)
    expect(rendered).to have_selector('table.disputed tbody tr', count: 5)

    expect(rendered).to have_selector('h1', text: 'Failed Charges', count: 1)
    expect(rendered).to have_selector('table.success tbody tr', count: 10)
  end
end
