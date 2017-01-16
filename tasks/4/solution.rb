RSpec.describe 'Version' do
  describe 'constructing a Version' do
    context 'when the version is constructed without an argument' do
      it 'is equal to 0' do
        version_constructed_without_argument = Version.new
        expect(version_constructed_without_argument).to eq Version.new("0")
      end
    end
    context 'when the version is constructed from the empty string' do
      it 'is equal to 0' do
        empty_string_version = Version.new("")
        expect(empty_string_version).to eq Version.new("0")
      end
    end
    context 'when the version is being constructed from an invalid string' do
      it 'raises an ArgumentError' do
        msg1 = "Invalid version string '.3.4'"
        msg2 = "Invalid version string '1..4.7'"
        msg3 = "Invalid version string '3.7rc'"
        expect { Version.new(".3.4")   }.to raise_error(ArgumentError, msg1)
        expect { Version.new("1..4.7") }.to raise_error(ArgumentError, msg2)
        expect { Version.new("3.7rc")  }.to raise_error(ArgumentError, msg3)
      end
    end
  end
  describe 'comparing Versions' do
    context 'when a version is constructed from another Version object' do
      it 'is equal to the one it is constructed from' do
        eq_version_1 = Version.new("5.4.7")
        eq_version_2 = Version.new(eq_version_1)
        expect(eq_version_1).to eq(eq_version_2)
      end
    end
    context 'when a version is logically equal to another' do
      it 'is equal to the other version' do
        eq_version_1 = Version.new("5.4.0")
        eq_version_2 = Version.new("5.4")
        expect(eq_version_1).to eq(eq_version_2)
      end
    end
    context 'when a version precedes or follows another' do
      it 'compares less or greater than the other version' do
        old_version = Version.new("0.1.9")
        new_version = Version.new("5.2")
        newer_version = Version.new("7.0.3")
        expect(old_version).to be < new_version
        expect(newer_version).to be > new_version
      end
    end
  end
  describe '#to_s' do
    context 'when a version is represented as a string' do
      it 'is represented as the string it was constructed from' do
        version = Version.new("3.12.1")
        expect(version.to_s).to eq("3.12.1")
      end
    end
    context 'except that when a version is constructed with trailing zeros' do
      it 'is represented canonically (without them) as a string' do
        version_with_trailing_zeroes = Version.new("1.1.1.0.0.0")
        expect(version_with_trailing_zeroes.to_s).to eq("1.1.1")
      end
    end
  end
  describe '#components' do
    context 'when the components of a version are requested' do
      it 'returns the Integer Array object of the canonical representation' do
        version1 = Version.new("1.2.0.0")
        version2 = Version.new("3.4.2.1")
        expect(version1.components).to eq([1, 2])
        expect(version2.components).to eq([3, 4, 2, 1])
      end
    end
    context 'when the components of a version are requested with parameter' do
      it 'returns the requested number of components' do
        version = Version.new("3.4.2.1")
        expect(version.components(3)).to eq([3, 4, 2])
        expect(version.components(5)).to eq([3, 4, 2, 1, 0])
      end
    end
  end
end