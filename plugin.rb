# name: discourse-TL1-invites
# about: Allows TL1 users to invite new users
# version: 0.0.2
# authors: Christoph Haug using code by Vinoth Kannan
# # url: https://github.com/tophee/discourse-TL1-invites

enabled_site_setting :tl1_invites_enabled

after_initialize do
  Guardian.class_eval do
    def can_invite_to_forum?(groups=nil)
      authenticated? &&
      (SiteSetting.max_invites_per_day.to_i > 0 || is_staff?) &&
      !SiteSetting.enable_sso &&
      SiteSetting.enable_local_logins &&
      (
        (!SiteSetting.must_approve_users? && @user.has_trust_level?(TrustLevel[1])) ||
       is_staff?
      ) &&
      (groups.blank? || is_admin?)
    end
    
    def can_invite_to?(object, group_ids=nil)
      return false unless authenticated?
      return true if is_admin?
      return false unless SiteSetting.enable_private_messages?
      return false if (SiteSetting.max_invites_per_day.to_i == 0 && !is_staff?)
      return false unless can_see?(object)
      return false if group_ids.present?

      if object.is_a?(Topic) && object.category
        if object.category.groups.any?
          return true if object.category.groups.all? { |g| can_edit_group?(g) }
        end
      end

      user.has_trust_level?(TrustLevel[1])
    end
  end
end

