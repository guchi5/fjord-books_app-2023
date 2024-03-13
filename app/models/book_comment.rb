# frozen_string_literal: true

class BookComment < ApplicationRecord
  belongs_to :book
  belongs_to :user
end
