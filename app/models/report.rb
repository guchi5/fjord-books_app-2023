# frozen_string_literal: true

class Report < ApplicationRecord
  has_many :report_comment, dependent: :destroy
end
