class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :views, through: :posts

  def self.most_viewed_users(limit = 10)
    joins(posts: :views)
      .group('users.id')
      .order('COUNT(views.id) DESC')
      .limit(limit)
  end
end
