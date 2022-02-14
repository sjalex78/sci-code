# frozen_string_literal: true

class Contributor < ApplicationRecord
  belongs_to :user
  belongs_to :poster
end
