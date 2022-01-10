class Word < ApplicationRecord
  validates :word, uniqueness: true  
  before_save :upcase_fields

  def upcase_fields
     word.upcase!
  end  
end
