# NVMe Sanitizeコマンド
```bash
sudo -i
loadkeys jp106
nvme sanitize /dev/nvme0n1 -a 2
nvme sanitize-log -H /dev/nvme0n1 #(SPROG)の値が65535ならok
nvme read /dev/nvme0n1 -s 0 -c 0 -z 512 | hexdump #出力が0ならok
reboot
```

# NixOSインストール

## rootユーザーに変更
```bash
sudo -i
```

## 日本語キーボードに変更
```bash
loadkeys jp106
```

## Wi-Fiに接続
```bash
nmtui
```

## パーティション切り
```bash
sgdisk -Z /dev/nvme0n1
sgdisk -n 1::+1G -n 2::-80G -t 1:ef00 -t 2:8304 /dev/nvme0n1
```

## フォーマット
```bash
mkfs.fat -F 32 /dev/nvme0n1p1
mkfs.btrfs /dev/nvme0n1p2
```

## マウント
```bash
mount /dev/nvme0n1p2 /mnt
mount -m /dev/nvme0n1p1 /mnt/boot
```

## configuration.nix等を生成
```bash
nixos-generate-config --root /mnt
```

## configuration.nixを編集
```bash
vim /mnt/etc/nixos/configuration.nix
```
```nix
# 以下のように編集または追記
console.keyMap = "jp106";
users.users.che = {
  isNormalUser = true;
  extraGroups = [ "networkmanager"  "wheel" ];
  initialPassword = "password";
}
environment.systemPackages = with pkgs; [
  git
  neovim
];
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

## インストール
```bash
nixos-install
```

## 再起動後ログインしたら`nmtui`でネットに接続し、このリポジトリをクローンしてビルド
```bash
git clone git@github.com:Che-0129/nixos-dots.git ~/.nixos-dots
sudo nixos-rebuild switch --flake ~/.nixos-dots#NixOS --impure
```
