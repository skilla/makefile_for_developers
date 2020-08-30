#!/usr/bin/env only_source

type make_help &>/dev/null && return 0

declare -r fg_black="$(tput setaf 0)"
declare -r fg_red="$(tput setaf 1)"
declare -r fg_green="$(tput setaf 2)"
declare -r fg_yellow="$(tput setaf 3)"
declare -r fg_blue="$(tput setaf 4)"
declare -r fg_fucsia="$(tput setaf 5)"
declare -r fg_cyan="$(tput setaf 6)"
declare -r fg_white="$(tput setaf 7)"

declare -r bg_black="$(tput setab 0)"
declare -r bg_red="$(tput setab 1)"
declare -r bg_green="$(tput setab 2)"
declare -r bg_yellow="$(tput setab 3)"
declare -r bg_blue="$(tput setab 4)"
declare -r bg_fucsia="$(tput setab 5)"
declare -r bg_cyan="$(tput setab 6)"
declare -r bg_white="$(tput setab 7)"

declare -r bold="$(tput bold)"
declare -r nobold="$(tput dim)"
declare -r underline="$(tput smul)"
declare -r nounderline="$(tput rmul)"
declare -r reverse="$(tput rev)"

declare -r attr_reset="$(tput sgr0)"

function _strlen() {
    echo ${#1}
    return 0
}

function _substr() {
    local string="$1"
    local initial_position=$2
    local length_to_be_draw=$(bc <<< "$3 - 1")

    echo "$string" | cut -c $initial_position-$(bc <<< "$initial_position + $length_to_be_draw")
    return 0
}

function _is_a_word_character() {
    local character_to_test="$1"
    for elem in {a..z} {A..Z} {0..9} ':' '.' ',' ';'; do
        [[ "$character_to_test" == "$elem" ]] && return 0
    done
    return 1
}

function _str_repeat() {
    local final_length=$1
    local char_to_repeat="$2"

    head -c $final_length /dev/zero | tr '\0' "$char_to_repeat"
    return 0
}

function _str_pad() {
    local string_to_pad="$1"
    local final_length=$2

    echo "$string_to_pad $(_str_repeat $final_length ' ')" | cut -c 1-$final_length
    return 0
}

function _format_target() {
    local string_to_show="$2"
    local maximum_length_to_show=$1
    local formatted_string=$(_str_pad "$string_to_show" $maximum_length_to_show)

    printf "%s%s%s" "$bold$fg_green" "$formatted_string" "$fg_white$nobold"
    return 0
}

function _format_separator() {
    printf "%s%s%s" "$fg_fucsia" " -> " "$fg_white"
    return 0
}

function _strip_pos() {
    local start=$1
    local character

    until false; do
        character=$(_substr "$2" $start 1)
        _is_a_word_character "$character"
        if [ $? -eq 1 ]; then
            break
        fi
        start=$(bc <<<"$start - 1")
    done

    echo $start
    return 0
}

function _format_help() {
    local tabulation_length=$1
    local maximum_length_to_show=$2
    local string_to_show="$3"
    local line_length=$(_strlen "$string_to_show")

    if [[ $maximum_length_to_show -ge $line_length ]]; then
        printf "%s%s%s\n" "$fg_cyan" "$string_to_show" "$fg_white"
        return 0
    fi

    if [ 0 -lt $(_strlen "$string_to_show") ]; then
        local pos=$(_strip_pos "$maximum_length_to_show" "$string_to_show")
        printf "%s%s%s\n" "$fg_cyan" "$(echo $string_to_show | cut -c 1-$pos)" "$fg_white"

        string_to_show=$(echo "$string_to_show" | cut -c $(bc <<< "$pos + 1")-)
    fi

    while [ 0 -lt $(_strlen "$string_to_show") ]; do
        local pos=$(_strip_pos "$maximum_length_to_show" "$string_to_show")
        printf "%s" "$(_str_repeat $tabulation_length ' ')"
        printf "%s%s%s\n" "$fg_cyan" "$(echo $string_to_show | cut -c 1-$pos)" "$fg_white"

        string_to_show=$(echo "$string_to_show" | cut -c $(bc <<< "$pos + 1")-)
    done
    return 0
}

function _format_example() {
    [ -z $1 ] && return 0
    tabulation=$(_str_repeat $1 ' ')
    shift

    while [ -n "$1" ]; do
        printf "%s%s%s%s%s\n" "$bold$fg_blue" "$tabulation" "| " "$1" "$nobold$fg_white"
        shift
    done

    return 0
}

function make_help() {
    if [[ $# -lt 2 ]]; then
        echo "Error: wrong number of parameters, need at least 2 strings"
        return 1
    fi

    target_length=${MAKEFILE_TARGET_LENGTH:-20}
    tab_length=$(bc <<<"$target_length + 4")
    max_length=${MAKEFILE_LINE_LENGTH:-80}
    help_length=$(bc <<<"$max_length - $tab_length")

    _format_target "$target_length" "$1"
    shift
    _format_separator
    _format_help "$tab_length" "$help_length" "$1"
    shift
    _format_example "$tab_length" "$@"
    return 0
}
