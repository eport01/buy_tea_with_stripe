class Purchase < ApplicationRecord
  belongs_to :tea
  enum status: { pending: 0, approved: 1, unapproved: 2 }
end
