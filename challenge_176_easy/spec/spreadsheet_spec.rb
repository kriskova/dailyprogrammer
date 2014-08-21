require_relative '../lib/spreadsheet'
describe Spreadsheet do
  before(:each) do
    @test = Spreadsheet.new
  end

  describe '#select_cells' do
    it 'should transform A5 to [[0,4]]' do
      expect(@test.select_cells('A5')).to eq([[0,4]])
    end
    
    it 'should transform A1:A1 to [[0,0]]' do
      expect(@test.select_cells('A1:A1')).to eq([[0,0]])
    end
  end

  describe '#evaluate' do
    it 'should convert A1:A5&B1 to [[0,0],[0,1],[0,2],[0,3],[0,4],[1,0]]' do
      expect(@test.send(:evaluate,'A1:A5&B1')).to eq([[0,0],[0,1],[0,2],[0,3],[0,4],[1,0]])
    end
  end
  
  describe '#calculate_range' do
    it 'should convert A1:A5 to [[0,0],[0,1],[0,2],[0,3],[0,4]]' do
      expect(@test.send(:calculate_range,'A1:A5')).to eq([[0,0],[0,1],[0,2],[0,3],[0,4]])
    end
    
    it 'should convert A1:B5 to [[0,0],[0,1],[0,2],[0,3],[0,4],[1,0],[1,1],[1,2],[1,3],[1,4]]' do
      expect(@test.send(:calculate_range,'A1:B5')).to eq([[0,0],[0,1],[0,2],[0,3],[0,4],[1,0],[1,1],[1,2],[1,3],[1,4]])
    end
  end
  
  describe '#convert_cell' do
    it 'should convert A5 to [0,4]' do
      expect(@test.send(:convert_cell,'A5')).to eq([0,4])
    end
  end

  describe '#bijective26' do
    it 'should convert A to 0' do
      expect('A'.bijective26).to eq(0)
    end
    
    it 'should convert AA to 26' do
      expect('AA'.bijective26).to eq(26)
    end
  end
end
