require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to :working? }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bike }

  describe ':release_bike' do
    it { expect :release_bike == Bike.new }
    it { expect Bike.new.respond_to? :working? }
    it "raises an error when there are no bikes available" do
      expect{ subject.release_bike }.to raise_error "No bikes available"
    end
  end

  describe ':dock' do
    it "raise a error when full" do
      subject.dock(Bike.new)
      expect { subject.dock Bike.new }.to raise_error "Docking station full"
    end
  end
end
