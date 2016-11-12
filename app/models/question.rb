class Question < ApplicationRecord
  validates_presence_of :content
  validates_uniqueness_of :base, if: :base
  has_many :answers
end
