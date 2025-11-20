{ config, pkgs, inputs, ... }:

{
    imports = [ inputs.mango.hmModules.mango ];

    wayland.windowManager.mango = {
        enable = true;
        settings = ''
#Window effect
border_radius=8
unfocused_opacity=0.9

#Animation
animation_type_open=zoom
animation_type_close=zoom
zoom_end_ratio=0.3
fadeout_begin_opacity=0.5
animation_duration_close=300

#Scroller Layout
scroller_structs=10
scroller_default_proportion=0.45

#Master-Stack Layout
new_is_master=0
default_mfact=0.5

#Overview
enable_hotarea=0

#Miscellaneous
sloppyfocus=0
warpcursor=0
cursor_theme=Adwaita
drag_tile_to_tile=1

#Keyboard
repeat_rate=30
repeat_delay=300
xkb_rules_layout=jp

#Trackpad Settings & Mouse
tap_to_click=0
trackpad_natural_scrolling=1
middle_button_emulation=1
accel_speed=-0.15

#Appearance
gappih=2
gappiv=2
gappoh=4
gappov=4
borderpx=2
focuscolor=0x5294e2ff

#Layout
tagrule=id:1,layout_name:tile
tagrule=id:2,layout_name:tile
tagrule=id:3,layout_name:tile
tagrule=id:4,layout_name:tile

#Key Bindings
bind=SUPER,Q,killclient
bind=SUPER+CTRL,R,reload_config

bind=SUPER,C,spawn,uwsm app -- foot
bind=SUPER,D,spawn,uwsm app -- firefox
bind=SUPER+CTRL,D,spawn,uwsm app -- firefox --private-window
bind=SUPER,space,spawn,uwsm app -- fuzzel
bind=SUPER+SHIFT+CTRL,space,setkeymode,power_menu
bind=SUPER,V,spawn_shell,uwsm app -- cliphist list | fuzzel -d | cliphist decode | wl-copy
bind=SUPER,E,spawn,uwsm app -- pcmanfm

bind=NONE,XF86AudioRaiseVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bind=NONE,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bind=NONE,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_SINK@ toggle
bind=NONE,XF86MonBrightnessUp,spawn,brightnessctl set 5%+
bind=NONE,XF86MonBrightnessDown,spawn,brightnessctl set 5%-

bind=SUPER,H,focusdir,left
bind=SUPER,J,focusdir,down
bind=SUPER,K,focusdir,up
bind=SUPER,L,focusdir,right
bind=SUPER+CTRL,H,exchange_client,left
bind=SUPER+CTRL,J,exchange_client,down
bind=SUPER+CTRL,K,exchange_client,up
bind=SUPER+CTRL,L,exchange_client,right
bind=SUPER+SHIFT,H,resizewin,-25,+0
bind=SUPER+SHIFT,J,resizewin,+0,+25
bind=SUPER+SHIFT,K,resizewin,+0,-25
bind=SUPER+SHIFT,L,resizewin,+25,+0

mousebind=SUPER,btn_left,moveresize,curmove
mousebind=SUPER,btn_right,moveresize,curresize

bind=SUPER,F,togglemaximizescreen,
bind=SUPER+CTRL,F,togglefullscreen,

bind=SUPER,T,setlayout,tile
bind=SUPER,S,setlayout,scroller

keymode=power_menu
bind=NONE,Q,setkeymode,default
bind=NONE,esc,setkeymode,default
bind=NONE,R,spawn,systemctl reboot
bind=NONE,S,spawn,systemctl suspend
bind=NONE,S,setkeymode,default
bind=NONE,P,spawn,systemctl poweroff
        '';
        autostart_sh = ''
uwsm app -- swaybg -i ~/.nixos-dots/wallpaper/nix-wallpaper-simple-blue.png &
uwsm app -- waybar &
uwsm app -- fcitx5 &
uwsm app -- wl-paste -t text -w cliphist store &
        '';
    };
}
