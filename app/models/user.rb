class User < ActiveRecord::Base

  has_many  :skill_users, dependent: :destroy
  has_many  :skills, through: :skill_users


  # proficiency_for
  # set_proficiency_for
  # user_with_proficiency
  def proficiency_for(skill)
    skill_user = self.skill_users.where(skill_id: skill.id).first
    skill_user.proficiency
  end


  def set_proficiency_for(skill, proficiency)
    skill_user = self.skill_users.where(skill_id: skill.id).first
    skill_user.proficiency = proficiency
    skill_user.save  
  end

end
