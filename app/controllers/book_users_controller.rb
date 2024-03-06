# frozen_string_literal: true

class BookUsersController < ApplicationController
  before_action :authenticate_account!

  def index
    @book_users = BookUser.page(params[:page]).order('created_at desc')
  end

  def show
    @book_user = BookUser.where('account_id == ?', params[:account_id])[0]
  end

  def edit
    users = BookUser.where 'account_id == ?', current_account.id
    if users[0].nil?
      user = BookUser.new
      user.account_id = current_account.id
      user.name = current_account.email
      user.save
      users = BookUser.where 'account_id == ?', current_account.id
    end
    @book_user = users[0]
  end

  def update
    obj = BookUser.where('account_id == ?', current_account.id)[0]
    obj.update(book_user_params)
    redirect_to '/books'
  end

  private

  def book_user_params
    params.require(:book_user).permit(:account_id, :name, :postal_code, :address, :self_introduction)
  end
end
