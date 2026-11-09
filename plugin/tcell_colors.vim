vim9script

if exists('g:loaded_tcell_colors')
  finish
endif
g:loaded_tcell_colors = true

# RGB values from https://github.com/gdamore/tcell/blob/main/color/color.go
var colors: dict<string> = {
  Black: '000000',
  Maroon: '800000',
  Green: '008000',
  Olive: '808000',
  Navy: '000080',
  Purple: '800080',
  Teal: '008080',
  Silver: 'C0C0C0',
  Gray: '808080',
  Red: 'FF0000',
  Lime: '00FF00',
  Yellow: 'FFFF00',
  Blue: '0000FF',
  Fuchsia: 'FF00FF',
  Aqua: '00FFFF',
  White: 'FFFFFF',
  AliceBlue: 'F0F8FF',
  AntiqueWhite: 'FAEBD7',
  AquaMarine: '7FFFD4',
  Azure: 'F0FFFF',
  Beige: 'F5F5DC',
  Bisque: 'FFE4C4',
  BlanchedAlmond: 'FFEBCD',
  BlueViolet: '8A2BE2',
  Brown: 'A52A2A',
  BurlyWood: 'DEB887',
  CadetBlue: '5F9EA0',
  Chartreuse: '7FFF00',
  Chocolate: 'D2691E',
  Coral: 'FF7F50',
  CornflowerBlue: '6495ED',
  Cornsilk: 'FFF8DC',
  Crimson: 'DC143C',
  DarkBlue: '00008B',
  DarkCyan: '008B8B',
  DarkGoldenrod: 'B8860B',
  DarkGray: 'A9A9A9',
  DarkGreen: '006400',
  DarkKhaki: 'BDB76B',
  DarkMagenta: '8B008B',
  DarkOliveGreen: '556B2F',
  DarkOrange: 'FF8C00',
  DarkOrchid: '9932CC',
  DarkRed: '8B0000',
  DarkSalmon: 'E9967A',
  DarkSeaGreen: '8FBC8F',
  DarkSlateBlue: '483D8B',
  DarkSlateGray: '2F4F4F',
  DarkTurquoise: '00CED1',
  DarkViolet: '9400D3',
  DeepPink: 'FF1493',
  DeepSkyBlue: '00BFFF',
  DimGray: '696969',
  DodgerBlue: '1E90FF',
  FireBrick: 'B22222',
  FloralWhite: 'FFFAF0',
  ForestGreen: '228B22',
  Gainsboro: 'DCDCDC',
  GhostWhite: 'F8F8FF',
  Gold: 'FFD700',
  Goldenrod: 'DAA520',
  GreenYellow: 'ADFF2F',
  Honeydew: 'F0FFF0',
  HotPink: 'FF69B4',
  IndianRed: 'CD5C5C',
  Indigo: '4B0082',
  Ivory: 'FFFFF0',
  Khaki: 'F0E68C',
  Lavender: 'E6E6FA',
  LavenderBlush: 'FFF0F5',
  LawnGreen: '7CFC00',
  LemonChiffon: 'FFFACD',
  LightBlue: 'ADD8E6',
  LightCoral: 'F08080',
  LightCyan: 'E0FFFF',
  LightGoldenrodYellow: 'FAFAD2',
  LightGray: 'D3D3D3',
  LightGreen: '90EE90',
  LightPink: 'FFB6C1',
  LightSalmon: 'FFA07A',
  LightSeaGreen: '20B2AA',
  LightSkyBlue: '87CEFA',
  LightSlateGray: '778899',
  LightSteelBlue: 'B0C4DE',
  LightYellow: 'FFFFE0',
  LimeGreen: '32CD32',
  Linen: 'FAF0E6',
  MediumAquamarine: '66CDAA',
  MediumBlue: '0000CD',
  MediumOrchid: 'BA55D3',
  MediumPurple: '9370DB',
  MediumSeaGreen: '3CB371',
  MediumSlateBlue: '7B68EE',
  MediumSpringGreen: '00FA9A',
  MediumTurquoise: '48D1CC',
  MediumVioletRed: 'C71585',
  MidnightBlue: '191970',
  MintCream: 'F5FFFA',
  MistyRose: 'FFE4E1',
  Moccasin: 'FFE4B5',
  NavajoWhite: 'FFDEAD',
  OldLace: 'FDF5E6',
  OliveDrab: '6B8E23',
  Orange: 'FFA500',
  OrangeRed: 'FF4500',
  Orchid: 'DA70D6',
  PaleGoldenrod: 'EEE8AA',
  PaleGreen: '98FB98',
  PaleTurquoise: 'AFEEEE',
  PaleVioletRed: 'DB7093',
  PapayaWhip: 'FFEFD5',
  PeachPuff: 'FFDAB9',
  Peru: 'CD853F',
  Pink: 'FFC0CB',
  Plum: 'DDA0DD',
  PowderBlue: 'B0E0E6',
  RebeccaPurple: '663399',
  RosyBrown: 'BC8F8F',
  RoyalBlue: '4169E1',
  SaddleBrown: '8B4513',
  Salmon: 'FA8072',
  SandyBrown: 'F4A460',
  SeaGreen: '2E8B57',
  Seashell: 'FFF5EE',
  Sienna: 'A0522D',
  Skyblue: '87CEEB',
  SlateBlue: '6A5ACD',
  SlateGray: '708090',
  Snow: 'FFFAFA',
  SpringGreen: '00FF7F',
  SteelBlue: '4682B4',
  Tan: 'D2B48C',
  Thistle: 'D8BFD8',
  Tomato: 'FF6347',
  Turquoise: '40E0D0',
  Violet: 'EE82EE',
  Wheat: 'F5DEB3',
  WhiteSmoke: 'F5F5F5',
  YellowGreen: '9ACD32',
}

for name in ['Gray', 'DimGray', 'DarkGray', 'DarkSlateGray', 'LightGray', 'LightSlateGray', 'SlateGray']
  colors[substitute(name, 'Gray', 'Grey', '')] = colors[name]
endfor

const base = ['Black', 'Maroon', 'Green', 'Olive', 'Navy', 'Purple', 'Teal', 'Silver',
  'Gray', 'Red', 'Lime', 'Yellow', 'Blue', 'Fuchsia', 'Aqua', 'White']
const levels = [0, 95, 135, 175, 215, 255]
for index in range(256)
  if index < 16
    colors['XTerm' .. index] = colors[base[index]]
  elseif index < 232
    var cube = index - 16
    colors['XTerm' .. index] = printf('%02X%02X%02X',
      levels[cube / 36], levels[cube / 6 % 6], levels[cube % 6])
  else
    var gray = 8 + (index - 232) * 10
    colors['XTerm' .. index] = printf('%02X%02X%02X', gray, gray, gray)
  endif
endfor

def DefineHighlights()
  for hex in uniq(sort(values(colors)))
    var channels = map([0, 2, 4], (_, offset) => str2nr(strpart(hex, offset, 2), 16) / 255.0)
    var linear = map(channels, (_, value) => value <= 0.04045 ? value / 12.92 : pow((value + 0.055) / 1.055, 2.4))
    var luminance = 0.2126 * linear[0] + 0.7152 * linear[1] + 0.0722 * linear[2]
    var foreground = luminance > 0.179 ? '#000000' : '#FFFFFF'
    execute 'highlight TcellColor' .. hex .. ' guibg=#' .. hex .. ' guifg=' .. foreground .. ' gui=NONE'
  endfor
enddef

export def Setup()
  for hex in uniq(sort(values(colors)))
    execute 'silent! syntax clear TcellColor' .. hex
  endfor
  for [name, hex] in items(colors)
    var token = '\%(tcell\.Color\|color\.\)' .. name
    if name =~ '^XTerm'
      var index = str2nr(strpart(name, 5))
      token = '\%(color\.' .. name .. (index >= 16 ? '\|tcell\.Color' .. index : '') .. '\)'
    endif
    execute 'syntax match TcellColor' .. hex
      .. ' /\C\<' .. token .. '\>/ containedin=ALL'
  endfor
enddef

augroup tcell_colors
  autocmd!
  autocmd ColorScheme * DefineHighlights()
augroup END

DefineHighlights()
if &syntax == 'go'
  Setup()
endif

