# name: discourse-TL1-invites
# about: Allows TL1 users to invite new users
# version: 0.0.1
# authors: Christoph Haug using code by Vinoth Kannan
# # url: https://github.com/tophee/discourse-TL1-invites

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
  end
end
