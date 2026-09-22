{ lib, pkgs, ... }:
let
  mozcConfig = pkgs.runCommand "mozc-config1.db" {
    nativeBuildInputs = [ pkgs.protobuf ];
    mozcConfigTextProto = ''
      general_config {
        config_version: 1
        last_modified_product_version: "2.30.5544.102"
        last_modified_time: 1782282504
        platform: "Linux"
      }
      verbose_level: 0
      incognito_mode: false
      check_default: true
      presentation_mode: false
      preedit_method: ROMAN
      session_keymap: CUSTOM
      custom_keymap_table: "status\tkey\tcommand\nComposition\tBackspace\tBackspace\nComposition\tDelete\tDelete\nComposition\tDown\tMoveCursorToEnd\nComposition\tEnd\tMoveCursorToEnd\nComposition\tEnter\tCommit\nComposition\tF10\tConvertToHalfAlphanumeric\nComposition\tF2\tConvertWithoutHistory\nComposition\tF6\tConvertToHiragana\nComposition\tF7\tConvertToFullKatakana\nComposition\tF8\tConvertToHalfWidth\nComposition\tF9\tConvertToFullAlphanumeric\nComposition\tHome\tMoveCursorToBeginning\nComposition\tLeft\tMoveCursorLeft\nComposition\tRight\tMoveCursorRight\nComposition\tSpace\tConvert\nComposition\tTab\tPredictAndConvert\nComposition\tVirtualLeft\tMoveCursorLeft\nComposition\tVirtualRight\tMoveCursorRight\nComposition\tVirtualEnter\tCommit\nConversion\tBackspace\tCancel\nConversion\tDelete\tCancel\nConversion\tDown\tConvertNext\nConversion\tEnd\tSegmentFocusLast\nConversion\tEnter\tCommit\nConversion\tF10\tConvertToHalfAlphanumeric\nConversion\tF6\tConvertToHiragana\nConversion\tF7\tConvertToFullKatakana\nConversion\tF8\tConvertToHalfWidth\nConversion\tF9\tConvertToFullAlphanumeric\nConversion\tHome\tSegmentFocusFirst\nConversion\tLeft\tSegmentFocusLeft\nConversion\tRight\tSegmentFocusRight\nConversion\tSpace\tConvertNext\nConversion\tTab\tPredictAndConvert\nConversion\tUp\tConvertPrev\nConversion\tVirtualLeft\tSegmentWidthShrink\nConversion\tVirtualRight\tSegmentWidthExpand\nConversion\tVirtualEnter\tCommitOnlyFirstSegment\nPrecomposition\tBackspace\tRevert\nPrecomposition\tSpace\tInsertSpace\nSuggestion\tDown\tPredictAndConvert\nComposition\tASCII\tInsertCharacter\nComposition\tKanji\tIMEOff\nComposition\tOFF\tIMEOff\nComposition\tON\tIMEOn\nConversion\tF1\tReportBug\nConversion\tF3\tReportBug\nConversion\tKanji\tIMEOff\nConversion\tOFF\tIMEOff\nConversion\tON\tIMEOn\nDirectInput\tKanji\tIMEOn\nDirectInput\tON\tIMEOn\nPrecomposition\tASCII\tInsertCharacter\nPrecomposition\tKanji\tIMEOff\nPrecomposition\tOFF\tIMEOff\nPrecomposition\tON\tIMEOn\n"
      punctuation_method: KUTEN_TOUTEN
      symbol_method: CORNER_BRACKET_MIDDLE_DOT
      space_character_form: FUNDAMENTAL_INPUT_MODE
      use_keyboard_to_change_preedit_method: false
      history_learning_level: DEFAULT_HISTORY
      selection_shortcut: SHORTCUT_123456789
      character_form_rules {
        group: "\343\202\242"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: FULL_WIDTH
      }
      character_form_rules {
        group: "A"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: LAST_FORM
      }
      character_form_rules {
        group: "0"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: LAST_FORM
      }
      character_form_rules {
        group: "(){}[]"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: LAST_FORM
      }
      character_form_rules {
        group: ".,"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: LAST_FORM
      }
      character_form_rules {
        group: "\343\200\202\343\200\201"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: FULL_WIDTH
      }
      character_form_rules {
        group: "\343\203\273\343\200\214\343\200\215"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: FULL_WIDTH
      }
      character_form_rules {
        group: "\"\'"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: LAST_FORM
      }
      character_form_rules {
        group: ":;"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: LAST_FORM
      }
      character_form_rules {
        group: "#%&@$^_|`\\"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: LAST_FORM
      }
      character_form_rules {
        group: "~"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: LAST_FORM
      }
      character_form_rules {
        group: "<>=+-/*"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: LAST_FORM
      }
      character_form_rules {
        group: "?!"
        preedit_character_form: FULL_WIDTH
        conversion_character_form: LAST_FORM
      }
      use_auto_ime_turn_off: true
      shift_key_mode_switch: ASCII_INPUT_MODE
      numpad_character_form: NUMPAD_HALF_WIDTH
      use_auto_conversion: false
      auto_conversion_key: 13
      yen_sign_character: YEN_SIGN
      use_japanese_layout: false
      use_date_conversion: true
      use_single_kanji_conversion: true
      use_symbol_conversion: true
      use_number_conversion: true
      use_emoticon_conversion: true
      use_calculator: true
      use_t13n_conversion: true
      use_zip_code_conversion: true
      use_spelling_correction: true
      use_emoji_conversion: true
      information_list_config {
        use_local_usage_dictionary: true
      }
      use_history_suggest: true
      use_dictionary_suggest: true
      use_realtime_conversion: true
      suggestions_size: 3
      use_mode_indicator: true
    '';
  } ''
    protoc \
      --proto_path=${pkgs.mozc.src}/src \
      --encode=mozc.config.Config \
      ${pkgs.mozc.src}/src/protocol/config.proto \
      <<< "$mozcConfigTextProto" \
      > $out
  '';
in
{
  home.activation.mozcConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    install -Dm644 ${mozcConfig} "$HOME/.config/mozc/config1.db"
  '';
}
