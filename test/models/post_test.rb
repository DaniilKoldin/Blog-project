require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @user = users(:example)
  end

  test 'should not save post' do
    post = Post.new
    assert_not post.save
  end

  test 'should save post' do
    title = Faker::Lorem.word
    body = Faker::Lorem.word
    summary = Faker::Lorem.word

    post = Post.new(title: title, summary: summary, body: body, :user_id => @user.id)
    assert post.save!
  end

  test 'should find post' do
    assert Post.find_by(title: 'MyString')
  end
end
