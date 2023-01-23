#!/usr/bin/env nu

export def rpi-exec [source_file: string] {
  let base_name = ($source_file | split row '.' | drop 1 | str join '.');  
  arm-none-eabi-as ($base_name + .s) -o ($base_name + .o);
  arm-none-eabi-objcopy ($base_name + .o) -O binary ($base_name + .bin)
  rpi-run.py ($base_name + .bin)
}