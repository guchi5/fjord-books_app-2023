# frozen_string_literal: true

class BookUser < ApplicationRecord
  belongs_to :account
end
