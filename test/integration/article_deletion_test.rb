require "test_helper"

class ArticleDeletionTest < ActionDispatch::IntegrationTest

  include Capybara::DSL

  test "user can delete an article" do
    article = Article.create(title: "This is a Title", body: "body body body")

    visit article_path(article)

    click_link_or_button("Delete")

    assert_equal current_path, articles_path

    refute page.has_content?("This is a Title")

  end
end



