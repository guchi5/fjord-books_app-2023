# frozen_string_literal: true

class ReportComment < ApplicationRecord
  belongs_to :report
  belongs_to :user
end
