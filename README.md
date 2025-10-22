# Onix (WIP)

> [!NOTE]
> These dotfiles are a work in progress and may
> not adhere to best practices. If you think you
> can lend a hand in making these dotfiles as good
> as possible then please issue a PR that will be
> reviewed and merged.

My NixOS dotfiles. Powered by [Flakes](https://nix.dev/concepts/flakes.html), [Home-Manager](https://nix-community.github.io/home-manager/index.xhtml), the [Caelestia Shell](https://github.com/caelestia-dots/shell) and [Hyprland](https://hypr.land).

For a guide on using flakes I would recommend reading: [NixOS and Flakes](https://nixos-and-flakes.thiscute.world)

1. [Semi-automatic Install](#semi-automatic-install)
2. [Manual Install](#manual-install)

## Semi-automatic Install
> [!IMPORTANT]
> Please do not run random scripts you find online.
> Always read them first to find out what they do.
> You can find this one at `install.sh`

To do a mostly automatic install run:
> sudo is required due to some files needing to be moved to `/etc/nixos`
```
curl -fsSL https://raw.githubusercontent.com/DoubleDotStudios/onix-dots/refs/heads/main/install.sh | sudo bash
```

## Manual Install
To use the dotfiles it takes a small amount of setup.

> [!IMPORTANT]
> There is most likely issues in this usage guide.
> If you find any, please issue a PR with the fix
> so that it can be merged.

1. Clone the repo:
`git clone https://github.com/DoubleDotStudios/nix-dotfiles.git`

2. Install [home-manager](https://nix-community.github.io/home-manager/index.xhtml) with flakes enabled in a [standalone fashion](https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-standalone)

3. Move the `home-manager` to `~/.config/home-manager`:
```console
mv home-manager ~/.config/home-manager
```

4. Replace my username and home directory with yours

5. Move the `etc/system.nix` to `/etc/nixos/`:
```console
sudo mv etc/system.nix /etc/nixos/
```

6. Include `system.nix` in your `configuration.nix`

7. Keep the following from your `configuration.nix` and remove other config options included in `system.nix`:
  - users
  - timezone
  - i18n
  - xkb
  - kernel

8. Move `etc/flake.nix` to `/etc/nixos/`:
```console
sudo mv etc/flake.nix /etc/nixos/
```

9. Run:
```console
sudo nixos-rebuild switch
home-manager switch
```
