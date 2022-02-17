# frozen_string_literal: true

class Contributor < ApplicationRecord
  belongs_to :user
  belongs_to :poster

  enum role: { disabled: 0, owner: 1, teacher: 2, editor: 3 }

  delegate :email, to: :user
end
