require 'docking_station'

describe DockingStation do
  bike = Bike.new

  describe '#dock' do
    it {is_expected.to respond_to(:dock).with(1).argument}
    it 'docks a bike' do
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'returns a bike that has been docked' do
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
    it 'raises an error when dockingstation is full' do
      (subject.capacity).times { subject.dock(bike) }
      expect{subject.dock(bike)}.to raise_error(RuntimeError)
    end
  end

  describe '#release_bike' do
    it {is_expected.to respond_to :release_bike}
    it 'raises an error when no bikes' do
      expect{subject.release_bike}.to raise_error(RuntimeError)
    end
    it 'releases a bike that works' do
      expect(bike).to be_instance_of(Bike)
      expect(bike).to be_working
    end
  end

  describe '#initialize' do
    it 'sets capacity' do
      expect(subject.capacity).to be DockingStation::DEFAULT_CAPACITY
    end
  end
end
