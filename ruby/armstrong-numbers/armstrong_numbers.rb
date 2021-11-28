module ArmstrongNumbers
  def include?(integer)
    integer == integer.digits.sum { |digit| digit**integer.digits.size }
  end
end

ArmstrongNumbers.extend ArmstrongNumbers
