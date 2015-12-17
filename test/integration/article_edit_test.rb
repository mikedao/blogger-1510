require "test_helper"

class ArticleCreationTest < ActionDispatch::IntegrationTest

  include Capybara::DSL

  test "user can edit an article" do
    article = Article.create(title: "OldTitle", body: "NewTitle")

    visit article_path(article)

    click_link_or_button("Edit")

    assert_equal current_path, edit_article_path(article)
    fill_in "article[title]", with: "NewTitle"
    fill_in "article[body]", with: "NewBody"

    click_link_or_button("Update Article")

    assert_equal current_path, article_path(article)

    assert page.has_content?("NewTitle")
    assert page.has_content?("NewBody")

  end

end

