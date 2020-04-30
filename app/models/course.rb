class Course < ApplicationRecord
    has_many :takings
    has_many :students, through: :takings
    has_many :preferences
    has_many :groups, -> { order(position: :asc)}, dependent: :destroy
    has_many :holdprojects, -> { order(position: :asc)}, dependent: :destroy
    belongs_to :professor
    validates :pin, uniqueness: true

    def has_enough_projects
        puts :course_id.to_s
        groups = Group.where(course_id: id).all
        active_groups = 0
        groups.each do |group|
            puts group.inspect
            if group.active
                active_groups += 1
            end
        end
        puts active_groups >= 3
        return active_groups >= 3
    end
end
