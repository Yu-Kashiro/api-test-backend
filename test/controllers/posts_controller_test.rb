require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = Post.create!(title: "Sample", content: "Content")
  end

  test "index" do
    get "/posts"
    assert_response :success
    body = JSON.parse(response.body)
    assert body.is_a?(Array)
  end

  test "show" do
    get "/posts/#{@post.id}"
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal @post.id, body["id"]
  end

  test "create" do
    assert_difference -> { Post.count }, 1 do
      post "/posts", params: { post: { title: "New Title", content: "Hello" } }, as: :json
    end
    assert_response :created
  end

  test "update" do
    patch "/posts/#{@post.id}", params: { post: { title: "Updated" } }, as: :json
    assert_response :success
    assert_equal "Updated", @post.reload.title
  end

  test "destroy" do
    assert_difference -> { Post.count }, -1 do
      delete "/posts/#{@post.id}"
    end
    assert_response :no_content
  end
end
