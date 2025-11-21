{ config, pkgs, ... }:

{
	programs.thunderbird = {
		enable = true;
		profiles.default = {
			isDefault = true;
			settings = {
				"font.name.sans-serif.ja" = "Noto Sans CJK JP";
				"intl.locale.requested" = "ja";
			};
		};
	}
}
