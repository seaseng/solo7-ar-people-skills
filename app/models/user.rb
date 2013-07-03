class User < ActiveRecord::Base

  has_many  :skill_users
  has_many  :skills, through: :skill_users


  # proficiency_for
  # set_proficiency_for
  # user_with_proficiency
  def proficiency_for(skill)
    skill_user = SkillUser.where(skill_id:  skill.id, user_id:  self.id)
    skill_user.pluck(:proficiency).first
  end


  def set_proficiency_for(skill, proficiency)
    skill_user = SkillUser.where(skill_id:  skill.id, user_id:  self.id)
    skill_user.each do |su|
      su.proficiency = proficiency
      su.save
    end
  end

  


end
