require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::AstronautsController, 'AstronautsController' do
  it 'should show all records' do
    as = subject.index
    expect(as).to eq 2
  end
end