=begin
Write your code for the 'Robot Name' exercise in this file. Make the tests in
`robot_name_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/robot-name` directory.
=end

class Robot
  def self.forget
    @@available_names = [*'AA000'..'ZZ999'].shuffle
  end

  def name
    @name ||= @@available_names.pop
  end

  def reset
    @name = nil
  end
end
