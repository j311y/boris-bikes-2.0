require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to :working? }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bike }
  it "should raise" do
    expect{:bike.non_existent_message}.to raise_error("No bikes available")
  end
end

describe :release_bike do
  it { expect :release_bike == Bike.new }
  it { expect Bike.new.respond_to? :working? }
end
