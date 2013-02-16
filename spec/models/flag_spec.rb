# coding: UTF-8

require 'spec_helper'

describe Flag do

  let(:flag) { Flag.create }

  it 'is initialized with the correct defaults' do
    expect(flag.latitude_default).to eq(0)
    expect(flag.longitude_default).to eq(0)
    expect(flag.latitude).to eq(0)
    expect(flag.longitude).to eq(0)
  end
end
