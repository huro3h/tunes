require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(url: 'https:expample1.com'),
      Event.create!(url: 'https:expample2.com')
    ])
  end

  it "renders a list of events" do
    render
  end
end
