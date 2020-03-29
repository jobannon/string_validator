require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "string_validator"

class StringValidatorTest < Minitest::Test
  def test_it_can_pass_the_simple_case_of_parens
    v = StringValidator.new 
    assert_equal true, v.validate("()")
  end

  def test_it_can_pass_with_a_few_bracket_parens_curly
    v = StringValidator.new 
    assert_equal true, v.validate("([{}[]])")
  end

  def test_it_will_return_false_if_given_non_matching_conditions
    v = StringValidator.new 
    assert_equal false, v.validate("()[")
  end

  def test_it_will_check_double_nested
    v = StringValidator.new 
    assert_equal true,  v.validate("([])")
  end

  def test_it_can_pass_with_some_other_char_even
    v = StringValidator.new 
    assert_equal true, v.validate("([{}af[]])")
  end

  def test_it_can_pass_with_some_other_char_odd
    v = StringValidator.new 
    assert_equal true, v.validate("([{}a[]])")
  end

  # other tests
  #
  # v.validate("([{}[]])")
  # => true
  # v.validate("()[")
  # => false
  # v.validate("([)]")
end
