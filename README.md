<p align="center">
  <img src="docs/images/aspenblue.png" alt="Logo">
</p>

# AspenBlue Pyrite

[![bluebuild build badge](https://github.com/aspenblue/pyrite/actions/workflows/build.yml/badge.svg)](https://github.com/aspenblue/pyrite/actions/workflows/build.yml)

A Fedora Atomic image with Pantheon DE and Elementary apps.

This image is based on [Fedora Atomic](https://fedoraproject.org/atomic-desktops/) 44 and [Universal Blue](https://universal-blue.org/) and made with [BlueBuild](https://blue-build.org/).  [https://github.com/fuwaflow/usagi/](https://github.com/fuwaflow/usagi/) was used  as a reference. 

Changes from Universal Blue base image and common Elementary images:
- [added] Pantheon Tweaks flatpak,
- [changed] Firefox browser package replaced with Flatpak version,
- [changed] Most Elementary apps replaced with their Flatpak versions (stable branch),
- [removed] Vim.

> [!NOTE]
> This is **not** an official Universal Blue image and it is built using unofficial COPR repositories. Currently, this image builds and runs successfully, but should be used with at own risk.
> This repository was developed using some directed AI assistance, although its contents have been manually tested and inspected.
## Installation
To install you can take any existing Fedora Atomic (including Univesal Blue) installation (i.e. Fedora Atomic Sway or Silverblue) and rebasing to this image:
1. Rebase to the unsigned image, to get the proper signing keys and policies installed
   ```bash
   rpm-ostree rebase ostree-unverified-registry:ghcr.io/aspenblue/pyrite:latest
   ```
2. Reboot to complete the rebase
   ```bash
   systemctl reboot
   ```
3. Rebase to the signed image
   ```bash
   rpm-ostree rebase ostree-image-signed:docker://ghcr.io/aspenblue/pyrite:latest
   ```
4. Reboot again to complete the installation
   ```bash
   systemctl reboot
   ```
The `latest` tag will automatically point to the latest build.
## Adding packages
You can add any package from Fedora repository using
```bash
rpm-ostree install <package name>
```
and rebooting. They will persist through image updates.
Or you can install any flatpak from Appcenter or Bazaar (Lite FE), they will also persist through image updates.
## Flavours
### Lite
AspenBlue Pyrite Lite as a mod of a default image with minor modification - disabled multiple workspaces:
-  [changed] Elementary dock has all of its workspace features disabled,
-  [changed] Application menu doesn't include Workspace switcher.
You can switch from default image to Lite with:
```bash
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/aspenblue/pyrite-lite:latest
```
and reboot. 
Or you can install it from the beginning replacing `pyrite:latest` image with `pyrite-lite:latest` in installation section. 
You can switch back to default image with:
```bash
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/aspenblue/pyrite:latest
```
and reboot.
### Lite FE (Fedorini Edition)
Lite FE is an opinionated version of image, it has several changes compared to Lite:
- [added] Webapp Manager,
- [added] Onlyoffice,
- [changed] Window buttons layout changed to match typical "Windows" layout,
- [changed] Appcenter replaced with Bazaar flatpak,
- [changed] Elementary Mail replaced with Mailspring flatpak.

> [!NOTE]
> Real set of apps and tweaks in this image is about to change at any time.

You can switch from default image to Lite FE with:
```bash
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/aspenblue/pyrite-lite-fe:latest
```
and reboot. 
Or you can install it from the beginning replacing `pyrite:latest` image with `pyrite-lite-fe:latest` in installation section. 
## ISO
If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/how-to/generate-iso/#_top). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.
```bash
bluebuild generate-iso --iso-name pyrite.iso image ghcr.io/aspenblue/pyrite:latest
```
## Verification
These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:
```bash
cosign verify --key cosign.pub ghcr.io/aspenblue/pyrite
```
## Thanks to
- [https://github.com/garaevdi/prosto/](https://github.com/garaevdi/prosto/) and [https://copr.fedorainfracloud.org/coprs/garaevdi/pantheon-rpm/](https://copr.fedorainfracloud.org/coprs/garaevdi/pantheon-rpm/)
- [https://github.com/fuwaflow/usagi/](https://github.com/fuwaflow/usagi/)
- [https://github.com/KyleGospo/webapp-manager/](https://github.com/KyleGospo/webapp-manager/) and [https://copr.fedorainfracloud.org/coprs/kylegospo/webapp-manager/](https://copr.fedorainfracloud.org/coprs/kylegospo/webapp-manager/)
