" vim-airline theme for Snazzy
" The following was used as a starting point:
" https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/apprentice.vim

let s:base03 = [ '#282a36', 233 ]
let s:base02 = [ '#3a3d4d', 236 ]
let s:base01 = [ '#44485b', 239 ]
let s:base00 = [ '#626784', 242  ]
let s:base0 = [ '#858db5', 244 ]
let s:base1 = [ '#949ecc', 246 ]
let s:base2 = [ '#a8b4ea', 248 ]
let s:base3 = [ '#f1f1f0', 253 ]
let s:yellow = [ '#f3f99d', 215 ]
let s:orange = [ '#fad07a', 222 ]
let s:red = [ '#ff5c57', 167 ]
let s:magenta = [ '#ff6ac1', 217 ]
let s:blue = [ '#57c7ff', 103 ]
let s:cyan = [ '#9aedfe', 110 ]
let s:green = [ '#5af78e', 107 ]

function! s:color_list(fg, bg) abort
  return [a:fg[0], a:bg[0], a:fg[1], a:bg[1]]
endfunction

let g:airline#themes#snazzy#palette = {}

let s:modified = {
  \ 'airline_c': s:color_list(s:orange, '')
  \ }
let s:warning = s:color_list(s:yellow, s:base01)
let s:error = s:color_list(s:red, s:base02)

let s:airline_a_normal = s:color_list(s:base02, s:blue)
let s:airline_b_normal = s:color_list(s:base1, s:base01)
let s:airline_c_normal = s:color_list(s:base3, s:base02)
let g:airline#themes#snazzy#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)
let g:airline#themes#snazzy#palette.normal_modified = s:modified
let g:airline#themes#snazzy#palette.normal.airline_warning = s:warning
let g:airline#themes#snazzy#palette.normal_modified.airline_warning = s:warning
let g:airline#themes#snazzy#palette.normal.airline_error = s:error
let g:airline#themes#snazzy#palette.normal_modified.airline_error = s:error

let s:airline_a_insert = s:color_list(s:base02, s:green)
let s:airline_b_insert = s:airline_b_normal
let s:airline_c_insert = s:airline_c_normal
let g:airline#themes#snazzy#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)
let g:airline#themes#snazzy#palette.insert_modified = s:modified
let g:airline#themes#snazzy#palette.insert.airline_warning = s:warning
let g:airline#themes#snazzy#palette.insert_modified.airline_warning = s:warning
let g:airline#themes#snazzy#palette.insert.airline_error = s:error
let g:airline#themes#snazzy#palette.insert_modified.airline_error = s:error

let s:airline_a_replace = s:color_list(s:base02, s:red)
let s:airline_b_replace = s:airline_b_normal
let s:airline_c_replace = s:airline_c_normal
let g:airline#themes#snazzy#palette.replace = airline#themes#generate_color_map(s:airline_a_replace, s:airline_b_replace, s:airline_c_replace)
let g:airline#themes#snazzy#palette.replace_modified = s:modified
let g:airline#themes#snazzy#palette.replace.airline_warning = s:warning
let g:airline#themes#snazzy#palette.replace_modified.airline_warning = s:warning
let g:airline#themes#snazzy#palette.replace.airline_error = s:error
let g:airline#themes#snazzy#palette.replace_modified.airline_error = s:error

let s:airline_a_visual = s:color_list(s:base02, s:yellow)
let s:airline_b_visual = s:airline_b_normal
let s:airline_c_visual = s:airline_c_normal
let g:airline#themes#snazzy#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)
let g:airline#themes#snazzy#palette.visual_modified = s:modified
let g:airline#themes#snazzy#palette.visual.airline_warning = s:warning
let g:airline#themes#snazzy#palette.visual_modified.airline_warning = s:warning
let g:airline#themes#snazzy#palette.visual.airline_error = s:error
let g:airline#themes#snazzy#palette.visual_modified.airline_error = s:error

let s:airline_a_inactive = s:color_list(s:base02, s:base00)
let s:airline_b_inactive = s:color_list(s:base0, s:base02)
let s:airline_c_inactive = s:airline_b_inactive
let g:airline#themes#snazzy#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive)
let g:airline#themes#snazzy#palette.inactive_modified = s:modified

let g:airline#themes#snazzy#palette.accents = {
  \ 'orange': s:color_list(s:orange, ''),
  \ 'blue': s:color_list(s:blue, ''),
  \ 'green': s:color_list(s:green, ''),
  \ 'purple': s:color_list(s:magenta, ''),
  \ 'yellow': s:color_list(s:yellow, ''),
  \ 'red': s:color_list(s:red, '')
  \ }
