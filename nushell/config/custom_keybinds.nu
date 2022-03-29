#!/usr/bin/env nu

let __custom_keybinds = [
 {
      name: move_right_word
      modifier: alt
      keycode: char_f
      mode: emacs
      event: { edit: movewordright }
    }
    {
      name: delete_line
      modifier: none
      keycode: Delete
      mode: emacs
      event: { edit: cleartolineend }
    }
    {
      name: delete_line
      modifier: none
      keycode: Delete
      mode: [emacs]
      event: { edit: cleartolineend }
    }
]
