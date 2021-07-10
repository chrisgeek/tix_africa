require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  let(:user)    { build :user }
  let(:event1) { build :event, id: 1 }
  let(:event2) { build :event, id: 2 }

  before do
    allow(view).to receive(:current_user).and_return(user)
    assign :events, [event1, event2]

    render template: 'events/index.html.erb'
  end

  it { expect(rendered).to match ERB::Util.h(event1.name) }
  it { expect(rendered).to match ERB::Util.h(event2.name) }
end
