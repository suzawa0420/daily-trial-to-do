# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  def comment_count
    sum_comment_count = self.tasks.map { |task| task.comments.count }
    sum_comment_count.sum
  end

  def comment_icons
    icons = tasks.map { |task| task.comments.map { |comment| comment.user.avatar_image } }
    icons.flatten
  end
end
