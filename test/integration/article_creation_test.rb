require "test_helper"

class ArticleCreationTest < ActionDispatch::IntegrationTest

  include Capybara::DSL

  test "user can create an article" do
    visit new_article_path

    fill_in "article[title]", with: "My First Blog Post"
    fill_in "article[body]", with: "I like pizza and Harry Potter"
    click_link_or_button("Create Article")

    assert page.has_content?("My First Blog Post")
    assert page.has_content?("I like pizza and Harry Potter")

    assert_equal current_path, article_path(Article.last)
  end
end
