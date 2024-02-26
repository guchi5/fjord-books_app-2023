# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource_or_scope) # rubocop:disable Lint/UnusedMethodArgument
    '/accounts/sign_in'
  end

  def after_sign_in_path_for(resource_or_scope) # rubocop:disable Lint/UnusedMethodArgument
    '/books'
  end
end
