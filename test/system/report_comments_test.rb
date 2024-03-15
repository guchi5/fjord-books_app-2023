# frozen_string_literal: true

require 'application_system_test_case'

class ReportCommentsTest < ApplicationSystemTestCase
  setup do
    @report_comment = report_comments(:one)
  end

  test 'visiting the index' do
    visit report_comments_url
    assert_selector 'h1', text: 'Report comments'
  end

  test 'should create report comment' do
    visit report_comments_url
    click_on 'New report comment'

    fill_in 'Content', with: @report_comment.content
    fill_in 'Report', with: @report_comment.report_id
    fill_in 'User', with: @report_comment.user_id
    click_on 'Create Report comment'

    assert_text 'Report comment was successfully created'
    click_on 'Back'
  end

  test 'should update Report comment' do
    visit report_comment_url(@report_comment)
    click_on 'Edit this report comment', match: :first

    fill_in 'Content', with: @report_comment.content
    fill_in 'Report', with: @report_comment.report_id
    fill_in 'User', with: @report_comment.user_id
    click_on 'Update Report comment'

    assert_text 'Report comment was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Report comment' do
    visit report_comment_url(@report_comment)
    click_on 'Destroy this report comment', match: :first

    assert_text 'Report comment was successfully destroyed'
  end
end
