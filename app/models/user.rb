class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :karma_points_sum

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    order('karma_points_sum DESC')
  end

  def self.page(num, per_page)
    if num == 0
      offset = 0
    else
      offset = (num.to_i - 1) * per_page
    end
    User.by_karma.limit(per_page).offset(offset)
  end

  def total_karma
    self.karma_points_sum
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.sum_cache(user, value)
    user.update_attributes(:karma_points_sum => user.karma_points_sum += value)
  end
end
