require 'minitest/autorun'
require_relative 'thue_morse_sequence'

class ThueMorseSequenceTest < MiniTest::Unit::TestCase
  def test_null_sequence_should_be_zero
    assert_equal "0", ThueMorseSequence.upto(0)
  end

  def test_first_sequence_should_be_01
    assert_equal "01", ThueMorseSequence.upto(1)
  end

  def test_second_sequence_should_be_0110
    assert_equal "0110", ThueMorseSequence.upto(2)
  end

  def test_third_sequence_should_be_01101001
    assert_equal "01101001", ThueMorseSequence.upto(3)
  end
  
  def test_4th_sequence_should_be_01101001
    assert_equal "0110100110010110", ThueMorseSequence.upto(4)
  end
  
  def test_5th_sequence_should_be_01101001
    assert_equal "01101001100101101001011001101001", ThueMorseSequence.upto(5)
  end
  
  def test_6th_sequence_should_be_01101001
    assert_equal "0110100110010110100101100110100110010110011010010110100110010110", ThueMorseSequence.upto(6)
  end
end
