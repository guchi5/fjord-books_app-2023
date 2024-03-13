# frozen_string_literal: true

class BookComment < ApplicationRecord
  belongs_to :book
end
