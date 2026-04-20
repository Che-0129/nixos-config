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

## インストール
```bash
nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest#disko-install -- --flake github:Che-0129/nixos-config#NixOS
```

## rootのパスワードを設定したら`poweroff`で電源を切り、USBメモリを取り外して起動
