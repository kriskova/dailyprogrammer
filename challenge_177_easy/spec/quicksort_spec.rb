require_relative '../quicksort'

describe 'Quicksort' do
  
  it 'should sort [] to []' do
    expect(quicksort([])).to eq([])
  end
  
  it 'should sort [1] to [1]' do
    expect(quicksort([1])).to eq([1])
  end
  
  it 'should sort [2,1] to [1,2]' do
    expect(quicksort([2,1])).to eq([1,2])
  end
  
  it 'should sort [2,1,1,2] to [1,1,2,2]' do
    expect(quicksort([2,1,2,1])).to eq([1,1,2,2])
  end
end