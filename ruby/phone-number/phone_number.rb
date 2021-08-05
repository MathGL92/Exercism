# =begin
# Write your code for the 'Phone Number' exercise in this file. Make the tests in
# `phone_number_test.rb` pass.

# To get started with TDD, see the `README.md` file in your
# `ruby/phone-number` directory.
# =end
# require 'byebug'

class PhoneNumber
  class << self
    def clean(phone_number)
      cleaned_phone_number = remove_non_digits_characters_and_country_code(phone_number)

      cleaned_phone_number if cleaned_phone_number.match?(valid_phone_number)
    end

    private

    def valid_phone_number
      /^([2-9]\d{2})?([2-9]\d{6})$/
    end

    def remove_non_digits_characters_and_country_code(phone_number)
      phone_number.gsub(/\D/, '').gsub(/^1/, '')
    end
  end
end
