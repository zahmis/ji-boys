class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true
  belongs_to :question, optional: true
end
