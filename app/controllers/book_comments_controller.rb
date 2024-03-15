# frozen_string_literal: true

class BookCommentsController < ApplicationController
  before_action :set_book_comment, only: %i[show edit update destroy]

  # GET /book_comments or /book_comments.json
  def index
    redirect_to books_path
  end

  # GET /book_comments/1 or /book_comments/1.json
  def show
    redirect_to books_path
  end

  # GET /book_comments/new
  def new
    @book_comment = BookComment.new
    @book = Book.find(params[:book_id].to_i)
  end

  # GET /book_comments/1/edit
  def edit
    redirect_to books_path if current_user != BookComment.find(params[:id]).user
  end

  # POST /book_comments or /book_comments.json
  def create
    @book_comment = BookComment.new(book_comment_params)

    respond_to do |format|
      if @book_comment.save
        format.html { redirect_to @book_comment.book, notice: t('controllers.common.notice_create', name: BookComment.model_name.human) }
        format.json { render :show, status: :created, location: @book_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_comments/1 or /book_comments/1.json
  def update
    respond_to do |format|
      if @book_comment.update(book_comment_params)
        format.html { redirect_to @book_comment.book, notice: t('controllers.common.notice_update', name: BookComment.model_name.human) }
        format.json { render :show, status: :ok, location: @book_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_comments/1 or /book_comments/1.json
  def destroy
    comment = BookComment.find(params[:id])
    book = comment.book
    @book_comment.destroy

    respond_to do |format|
      format.html { redirect_to book, notice: t('controllers.common.notice_destroy', name: BookComment.model_name.human) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book_comment
    @book_comment = BookComment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_comment_params
    params.require(:book_comment).permit(:book_id, :user_id, :content)
  end
end
