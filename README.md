# sakura-text-converter

This package is a text converter like the Sakura Editor.

![A screenshot](https://github.com/ijnoops198/sakura-text-converter/raw/master/screenshot.gif)

## Install

Using apm:

`apm install sakura-text-converter`

Or search for sakura-text-converter in Atom settings view.

## 全角→半角

###### It converts the full-width text to half-width text.

menu: `[Edit]-[Text]-[全角→半角]`

context menu: `[Convert]-[全角→半角]`

command: `sakura-text-converter:wideToHalf`

convert target characters: `full-width alphabets and numbers`, `full-width symbols`, `full-width katakana`, `hiragana`

## 半角+全角ひら→全角・カタカナ

###### It converts the full-width and half-width text and hiragana to full-width text and katakana.

menu: `[Edit]-[Text]-[半角+全角ひら→全角・カタカナ]`

context menu: `[Convert]-[半角+全角ひら→全角・カタカナ]`

command: `sakura-text-converter:halfWithWideWithHiraganaToWideKana`

convert target characters: `full-width alphabets and numbers`, `half-width symbols`, `half-width katakana`, `hiragana`

## 半角+全角カタ→全角・ひらがな

###### It converts the full-width and half-width text and katakana to full-width text and hiragana.

menu: `[Edit]-[Text]-[半角+全角カタ→全角・ひらがな]`

context menu: `[Convert]-[半角+全角カタ→全角・ひらがな]`

command: `sakura-text-converter:halfWithWideWithKanaToHiragana`

convert target characters: `full-width alphabets and numbers`, `half-width symbols`, `half-width katakana`, `full-width katakana`

## 全角英数→全角英数

###### It converts the full-width alphabets,numbers,symbols to half-width text.

menu: `[Edit]-[Text]-[全角英数→全角英数]`

context menu: `[Convert]-[全角英数→全角英数]`

command: `sakura-text-converter:wideAlphabetWithNumberToHalfAlphabetWithNumber`

convert target characters: `full-width alphabets and numbers`, `full-width symbols`

## 全角英数→全角英数

###### It converts the half-width alphabets,numbers,symbols to full-width text.

menu: `[Edit]-[Text]-[全角英数→全角英数]`

context menu: `[Convert]-[全角英数→全角英数]`

command: `sakura-text-converter:halfAlphabetWithNumberToWideAlphabetWithNumber`

convert target characters: `full-width alphabets and numbers`, `half-width symbols`

## 全角カタカナ→半角カタカナ

###### It converts the full-width katakana to half-width text.

menu: `[Edit]-[Text]-[全角カタカナ→半角カタカナ]`

context menu: `[Convert]-[全角カタカナ→半角カタカナ]`

command: `sakura-text-converter:wideKanaToHalfKana`

convert target characters: `full-width katakana`

## 半角カタカナ→全角カタカナ

###### It converts the half-width katakana to full-width text.

menu: `[Edit]-[Text]-[半角カタカナ→全角カタカナ]`

context menu: `[Convert]-[半角カタカナ→全角カタカナ]`

command: `sakura-text-converter:halfKanaToWideKana`

convert target characters: `half-width katakana`

## 半角カタカナ→ひらがな

###### It converts the half-width katakana to hiragana.

menu: `[Edit]-[Text]-[半角カタカナ→ひらがな]`

context menu: `[Convert]-[半角カタカナ→ひらがな]`

command: `sakura-text-converter:halfKanaToHiragana`

convert target characters: `half-width katakana`
