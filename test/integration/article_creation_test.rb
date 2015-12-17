require "test_helper"

class ArticleCreationTest < ActionDispatch::IntegrationTest

  include Capybara::DSL

  test "user can create an article" do
    visit new_article_path

    fill_in "article[title]", with: "title"
    fill_in "article[body]", with: "body"
    click_link_or_button("Create Article")

    assert page.has_content?("title")
    assert page.has_content?("body")

    assert_equal current_path, article_path(Article.last)

  end
end
