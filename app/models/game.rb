class Game < ApplicationRecord
  belongs_to :word
  belongs_to :user
  before_save :upcase_fields

  def upcase_fields
    invalid_letters&.upcase!
  end
end
