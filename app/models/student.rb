# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query)
    if query.present?
      where('NAME like ?', "%#{query}%")
    else
      self.all
    end
  end
end

# so the ? is a place holder, basiccally saying that we're going to put another variable here

# and the second argument is the variable that will replace the ? in the query statement

# "  where('NAME like ?', "%#{query}%") "
