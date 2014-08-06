class ThueMorseSequence
  def self.upto(n)
    if n == 0
      puts "0    0"; return "0"
    end

    previous = upto(n-1)
    present = previous + previous.tr("01","10")
    puts "#{n}    #{present}"
    present
  end
end

ThueMorseSequence.upto(6)
