require_relative '../lib/longest_word.rb'

describe LongestWord do
  it 'shouldnt return nil or be empty' do
    expect(LongestWord::from_characters("try","t r y")).not_to be_nil
    expect(LongestWord::from_characters("try","t r y")).not_to be_empty
  end

  it 'should return No Words Found if no match found' do
    expect(LongestWord::from_characters("abc","d e f")).to eq("No Words Found")
  end

  it 'should return the longest matching word from the available characters' do
    expect(LongestWord::from_characters("ab abc abcd abba defg","a b c")).to eq("abc")
  end

  it 'should use every character once' do
    expect(LongestWord::from_characters("abc abba ","a b c")).to eq("abc")
  end

  it 'should work on the sample input' do
    expect(LongestWord::from_characters("abc cca aaaaaa bca ","a b c")).to eq("abc bca")
  end

  it 'should work on the Challenge input 1' do
    words = "hello yyyyyyy yzyzyzyzyzyz mellow well yo kellow lellow abcdefhijkl hi is yellow just here to add strings fellow lellow llleow"
    chars = "l e l o h m f y z a b w"
    expect(LongestWord::from_characters(words, chars)).to eq("mellow yellow fellow")
  end

  it 'should work on the Challenge input 2 - nothing to bw found' do
    words = "sad das day mad den foot ball down touch pass play"
    chars = "z a d f o n "
    expect(LongestWord::from_characters(words, chars)).to eq("No Words Found")
  end

end
