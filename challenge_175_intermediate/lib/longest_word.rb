class LongestWord
  def self.from_characters(words,characters)
    @chars = characters
    match = words.split(" ").select { |word| characters_match?(word)}
    match.empty? ? "No Words Found" : match.group_by(&:size).max.last.join(" ")
  end

  private

  def self.characters_count(char_array)
    char_array.inject(Hash.new(0)){|hash, char| hash[char] += 1; hash}
  end

  def self.characters_match?(word)
    word.chars.all? {|char| @chars.count(char) >= word.count(char)}
  end
end
