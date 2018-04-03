require 'spec_helper'
require_relative '../../lib/grid'
require_relative '../../lib/coordinate'

describe Grid do
  let(:grid) { Grid.new }

  it 'returns coordinates' do
    expect(grid.size).to eql(10)
  end
end
