# NixOSインストール

## NVMe sanitize
```bash
sudo -i
loadkeys jp106
nvme sanitize /dev/nvme0n1 -a 2
nvme sanitize-log /dev/nvme0n1 -H #(SPROG)の値が65535ならok
nvme read /dev/nvme0n1 -s 0 -c 0 -z 512 | hexdump #出力が0ならok
```

## Wi-Fiに接続
```bash
nmtui
```

## インストール
```bash
nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- -f github:Che-0129/nixos-config#NixOS -m destroy,format,mount --yes-wipe-all-disks
nixos-install --flake github:Che-0129/nixos-config#NixOS --no-root-passwd
```

## rootのパスワードを設定したら`poweroff`で電源を切り、USBメモリを取り外して起動
