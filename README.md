# discourse-TL1-invites

This is a simple plugin that changes the trust level requirement for invites from TL2 to TL1. This includes forum invites as well as topic invites. The idea is to allow users to invite new users already at an early stage in order to foster community growth.

For more information about the origins of this plugin, see [this discussion](https://meta.discourse.org/t/hack-to-enable-invitations-for-trust-level-1-users/44103/?u=tophee).

## Usage
To use this plugin, install it like any other discourse plugin (as described [here](https://meta.discourse.org/t/install-a-plugin/19157/?u=tophee)). The plugin can be enabled/disabled in the site settings.

**A word of caution**: When turning this plugin on, you are allowing TL1 users to add new users to your forum without them being sandboxed at TL0 for a short while (because invited users are granted TL1 by default). It is probably best to enable TL1 invites in the early phase of building your community and turn it off later on.

## Possible future development
* Rather than granting invites to all TL1 users, grant invites to members of a custom group only

## License
MIT
