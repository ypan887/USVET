class Question < ApplicationRecord
  validates_uniqueness_of :base, if: :base
  has_many :answers
end
