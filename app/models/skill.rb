class Skill < ActiveRecord::Base

  has_many  :skill_users, dependent: :destroy
  has_many  :users, through:  :skill_users
  validates_uniqueness_of :name

  def user_with_proficiency(proficiency)
    skill_user = SkillUser.find_by_proficiency(proficiency)
    user = User.find(skill_user.user_id)
    user
    # self.users.where(proficiency: proficiency)
  end

end
