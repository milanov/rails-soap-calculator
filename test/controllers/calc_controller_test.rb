require 'test_helper'

class CalcControllerTest < ActiveSupport::TestCase

  test "adding two numbers" do
    result = savon(:add, message: { :left_operand => 3, :right_operand => 4.5 })

    assert_equal 7.5, result.to_f
  end

  test "adding to a negative number" do
    result = savon(:add, message: { :left_operand => -7, :right_operand => 4 })

    assert_equal -3.0, result.to_f
  end

  test "subtracting two numbers" do
    result = savon(:sub, message: { :left_operand => 7, :right_operand => 4.5 })

    assert_equal 2.5, result.to_f
  end

  test "subtracting to a negative number" do
    result = savon(:sub, message: { :left_operand => 4, :right_operand => 7 })

    assert_equal -3.0, result.to_f
  end

  test "multiplying two numbers" do
    result = savon(:mul, message: { :left_operand => 7, :right_operand => 4.5 })

    assert_equal 31.5, result.to_f
  end

  test "multiplying to a negative number" do
    result = savon(:mul, message: { :left_operand => -4, :right_operand => 7 })

    assert_equal -28.0, result.to_f
  end

  test "dividing two numbers" do
    result = savon(:div, message: { :left_operand => 7, :right_operand => 2 })

    assert_equal 3.5, result.to_f
  end

  test "dividing to a negative number" do
    result = savon(:div, message: { :left_operand => -15, :right_operand => 4 })

    assert_equal -3.75, result.to_f
  end

  test "division by zero raises a soap fault exception" do
    err = assert_raises Savon::SOAPFault do 
      savon(:div, message: { :left_operand => 3, :right_operand => 0 })
    end

    assert_match /division by zero/, err.message
  end

end
