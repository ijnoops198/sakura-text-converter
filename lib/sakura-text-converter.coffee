###
サクラエディタライクなテキスト変換

全角 -> 半角
半角+全角ひらがな -> 全角・カタカナ
半角+全角カタカナ -> 全角・ひらがな
全角英数 -> 半角英数
半角英数 -> 全角英数
全角カタカナ -> 半角カタカナ
半角カタカナ -> 全角カタカナ
半角カタカナ -> 全角ひらがな
###
{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null
  # 全角カタカナテーブル
  wideKana: [
    'ア', 'イ', 'ウ', 'エ', 'オ',
    'カ', 'キ', 'ク', 'ケ', 'コ',
    'サ', 'シ', 'ス', 'セ', 'ソ',
    'タ', 'チ', 'ツ', 'テ', 'ト',
    'ナ', 'ニ', 'ヌ', 'ネ', 'ノ',
    'ハ', 'ヒ', 'フ', 'へ', 'ホ',
    'マ', 'ミ', 'ム', 'メ', 'モ',
    'ヤ', 'ユ', 'ヨ',
    'ラ', 'リ', 'ル', 'レ', 'ロ',
    'ワ', 'ヲ', 'ン',
    'ヴ',
    'ガ', 'ギ', 'グ', 'ゲ', 'ゴ',
    'ザ', 'ジ', 'ズ', 'ゼ', 'ゾ',
    'ダ', 'ヂ', 'ヅ', 'デ', 'ド',
    'バ', 'ビ', 'ブ', 'ベ', 'ボ',
    'パ', 'ピ', 'プ', 'ペ', 'ポ',
    'ァ', 'ィ', 'ゥ', 'ェ', 'ォ',
    'ヵ', 'ヶ',
    'ッ',
    'ャ', 'ュ', 'ョ',
    'ヮ', 'ォ',
    'ヱ'
    ]
  # 半角カタカナテーブル
  halfKana: [
    'ｱ', 'ｲ', 'ｳ', 'ｴ', 'ｵ',
    'ｶ', 'ｷ', 'ｸ', 'ｹ', 'ｺ',
    'ｻ', 'ｼ', 'ｽ', 'ｾ', 'ｿ',
    'ﾀ', 'ﾁ', 'ﾂ', 'ﾃ', 'ﾄ',
    'ﾅ', 'ﾆ', 'ﾇ', 'ﾈ', 'ﾉ',
    'ﾊ', 'ﾋ', 'ﾌ', 'ﾍ', 'ﾎ',
    'ﾏ', 'ﾐ', 'ﾑ', 'ﾒ', 'ﾓ',
    'ﾔ', 'ﾕ', 'ﾖ',
    'ﾗ', 'ﾘ', 'ﾙ', 'ﾚ', 'ﾛ',
    'ﾜ', 'ｦ', 'ﾝ',
    'ｳﾞ',
    'ｶﾞ', 'ｷﾞ', 'ｸﾞ', 'ｹﾞ', 'ｺﾞ',
    'ｻﾞ', 'ｼﾞ', 'ｽﾞ', 'ｾﾞ', 'ｿﾞ',
    'ﾀﾞ', 'ﾁﾞ', 'ﾂﾞ', 'ﾃﾞ', 'ﾄﾞ',
    'ﾊﾞ', 'ﾋﾞ', 'ﾌﾞ', 'ﾍﾞ', 'ﾎﾞ',
    'ﾊﾟ', 'ﾋﾟ', 'ﾌﾟ', 'ﾍﾟ', 'ﾎﾟ',
    'ｧ', 'ｨ', 'ｩ', 'ｪ', 'ｫ',
    'ｶ', 'ｹ',
    'ｯ',
    'ｬ', 'ｭ', 'ｮ',
    'ﾜ', 'ｫ',
    'ｴ'
    ]
  # ひらがなテーブル
  hiragana: [
    'あ', 'い', 'う', 'え', 'お',
    'か', 'き', 'く', 'け', 'こ',
    'さ', 'し', 'す', 'せ', 'そ',
    'た', 'ち', 'つ', 'て', 'と',
    'な', 'に', 'ぬ', 'ね', 'の',
    'は', 'ひ', 'ふ', 'へ', 'ほ',
    'ま', 'み', 'む', 'め', 'も',
    'や', 'ゆ', 'よ',
    'ら', 'り', 'る', 'れ', 'ろ',
    'わ', 'を', 'ん',
    'ゔ',
    'が', 'ぎ', 'ぐ', 'げ', 'ご',
    'ざ', 'じ', 'ず', 'ぜ', 'ぞ',
    'だ', 'ぢ', 'づ', 'で', 'ど',
    'ば', 'び', 'ぶ', 'べ', 'ぼ',
    'ぱ', 'ぴ', 'ぷ', 'ぺ', 'ぽ',
    'ぁ', 'ぃ', 'ぅ', 'ぇ', 'ぉ',
    'ヵ', 'ヶ',
    'っ',
    'ゃ', 'ゅ', 'ょ',
    'ゎ', 'ぉ',
    'ゑ'
  ]
  # 全角アルファベットテーブル
  wideAlphabet:[
    'Ａ', 'Ｂ', 'Ｃ', 'Ｄ', 'Ｅ', 'Ｆ', 'Ｇ',
    'Ｈ', 'Ｉ', 'Ｊ', 'Ｋ', 'Ｌ', 'Ｍ', 'Ｎ',
    'Ｏ', 'Ｐ', 'Ｑ', 'Ｒ', 'Ｓ', 'Ｔ', 'Ｕ',
    'Ｖ', 'Ｗ', 'Ｘ', 'Ｙ', 'Ｚ',
    'ａ', 'ｂ', 'ｃ', 'ｄ', 'ｅ', 'ｆ', 'ｇ',
    'ｈ', 'ｉ', 'ｊ', 'ｋ', 'ｌ', 'ｍ', 'ｎ',
    'ｏ', 'ｐ', 'ｑ', 'ｒ', 'ｓ', 'ｔ', 'ｕ',
    'ｖ', 'ｗ', 'ｘ', 'ｙ', 'ｚ'
  ]
  # 半角アルファベットテーブル
  halfAlphabet: [
    'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U',
    'V', 'W', 'X', 'Y', 'Z',
    'a', 'b', 'c', 'd', 'e', 'f', 'g',
    'h', 'i', 'j', 'k', 'l', 'm', 'n',
    'o', 'p', 'q', 'r', 's', 't', 'u',
    'v', 'w', 'x', 'y', 'z'
  ]
  # 全角数字
  wideNumber: [
    '０', '１',  '２',  '３',  '４',  '５',  '６',  '７',  '８',  '９'
  ]
  # 半角数字
  halfNumber: [
    '0', '1',  '2',  '3',  '4',  '5',  '6',  '7',  '8',  '9'
  ]
  # 全角記号
  wideSymbol: [
    '　', '‘', '－', '＝', '［', '］', '￥', '；', '’', '，',
    '．', '／', '￣', '！', '＠', '＃', '＄', '％', '＾', '＆',
    '＊', '（', '）', '＿', '＋', '｛', '｝', '｜', '：', '”',
    '＜', '＞', '？'
  ]
  # 半角記号
  halfSymbol: [
    ' ', '`', '-', '=', '[', ']', '\\', ';', '\'', ',',
    '.', '/', '~', '!', '@', '#', '$', '%', '^', '&',
    '*', '(', ')', '_', '+', '{', '}', '|', ':', '"',
    '<', '>', '?'
  ]


  ###
  初期処理
  ###
  activate: (state) ->
    @subscriptions = new CompositeDisposable
    # 全角を半角に変換
    @subscriptions.add atom.commands.add 'atom-workspace',
      'sakura-text-converter:wideToHalf': => @wideToHalf()
    # 半角+全角ひらがなを全角・カタカナに変換
    @subscriptions.add atom.commands.add 'atom-workspace',
      'sakura-text-converter:halfWithWideWithHiraganaToWideKana': => @halfWithWideWithHiraganaToWideKana()
    # 半角+全角カタカナを全角・ひらがなに変換
    @subscriptions.add atom.commands.add 'atom-workspace',
      'sakura-text-converter:halfWithWideWithKanaToHiragana': => @halfWithWideWithKanaToHiragana()
    # 全角英数を半角英数に変換
    @subscriptions.add atom.commands.add 'atom-workspace',
      'sakura-text-converter:wideAlphabetWithNumberToHalfAlphabetWithNumber': => @wideAlphabetWithNumberToHalfAlphabetWithNumber()
    # 半角英数を全角英数に変換
    @subscriptions.add atom.commands.add 'atom-workspace',
      'sakura-text-converter:halfAlphabetWithNumberToWideAlphabetWithNumber': => @halfAlphabetWithNumberToWideAlphabetWithNumber()
    # 全角カタカナを半角カタカナに変換
    @subscriptions.add atom.commands.add 'atom-workspace',
      'sakura-text-converter:wideKanaToHalfKana': => @wideKanaToHalfKana()
    # 半角カタカナを全角カタカナに変換
    @subscriptions.add atom.commands.add 'atom-workspace',
      'sakura-text-converter:halfKanaToWideKana': => @halfKanaToWideKana()
    # 半角カタカナをひらがなに変換
    @subscriptions.add atom.commands.add 'atom-workspace',
      'sakura-text-converter:halfKanaToHiragana': => @halfKanaToHiragana()

  ###
  終了処理
  ###
  deactivate: ->
    @subscriptions.dispose()

  ###
  全角を半角に変換します。
  @param text 置き換え前のテキスト
  @return 置き換え後のテキスト
  ###
  wideToHalf: (text) ->
    @executeConvert 'wideToHalf'

  ###
  半角+全角ひらがなを全角・カタカナに変換します。
  @param text 置き換え前のテキスト
  @return 置き換え後のテキスト
  ###
  halfWithWideWithHiraganaToWideKana: (text) ->
    @executeConvert 'halfWithHiraganaToWideWithWideKana'

  ###
  半角+全角カタカナを全角・ひらがなに変換します。
  @param text 置き換え前のテキスト
  @return 置き換え後のテキスト
  ###
  halfWithWideWithKanaToHiragana: (text) ->
    @executeConvert 'halfWithWideWithKanaToHiragana'

  ###
  全角英数を半角英数に変換します。
  @param text 置き換え前のテキスト
  @return 置き換え後のテキスト
  ###
  wideAlphabetWithNumberToHalfAlphabetWithNumber: (text) ->
    @executeConvert 'wideAlphabetWithNumberToHalfAlphabetWithNumber'

  ###
  半角英数を全角英数に変換します。
  @param text 置き換え前のテキスト
  @return 置き換え後のテキスト
  ###
  halfAlphabetWithNumberToWideAlphabetWithNumber: (text) ->
    @executeConvert 'halfAlphabetWithNumberToWideAlphabetWithNumber'

  ###
  全角カタカナを半角カタカナに変換します。
  @param text 置き換え前のテキスト
  @return 置き換え後のテキスト
  ###
  wideKanaToHalfKana: (text) ->
    @executeConvert 'wideKanaToHalfKana'

  ###
  半角カタカナを全角カタカナに変換します。
  @param text 置き換え前のテキスト
  @return 置き換え後のテキスト
  ###
  halfKanaToWideKana: (text) ->
    @executeConvert 'halfKanaToWideKana'

  ###
  半角カタカナをひらがなに変換します。
  @param text 置き換え前のテキスト
  @return 置き換え後のテキスト
  ###
  halfKanaToHiragana: (text) ->
    @executeConvert 'halfKanaToHiragana'

  ###
  置き換え処理を行う。
  @param type 変換処理タイプ
  ###
  executeConvert: (type) ->
    if editor = atom.workspace.getActiveTextEditor()
      # テキストの選択範囲を取得する
      # 短形選択されている場合があるので複数のテキスト選択範囲を取得する
      ranges = editor.getSelectedBufferRanges()
      for range, i in ranges
        # テキスト選択がされていない場合、rangeのstartとendが同じ値になっている
        if not range.start.isEqual(range.end)
          # 選択されているテキストを取得する
          text = editor.getBuffer().getTextInRange(range)
          if type is 'wideToHalf'
            # 全角を半角に変換する
            replacedTextStatusMap = { }
            res = @replaceText text, replacedTextStatusMap, @hiragana, @halfKana
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @wideKana, @halfKana
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @wideAlphabet, @halfAlphabet
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @wideNumber, @halfNumber
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @wideSymbol, @halfSymbol
            editor.setTextInBufferRange(range, res.replacedText)
          else if type is 'halfWithHiraganaToWideWithWideKana'
            # 半角+全角ひらがなを全角・カタカナに変換する
            replacedTextStatusMap = { }
            res = @replaceText text, replacedTextStatusMap, @hiragana, @wideKana
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @halfKana, @wideKana
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @halfAlphabet, @wideAlphabet
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @halfNumber, @wideNumber
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @halfSymbol, @wideSymbol
            editor.setTextInBufferRange(range, res.replacedText)
          else if type is 'halfWithWideWithKanaToHiragana'
            # 半角+全角カタカナを全角・ひらがなに変換する
            replacedTextStatusMap = { }
            res = @replaceText text, replacedTextStatusMap, @wideKana, @hiragana
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @halfKana, @hiragana
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @halfAlphabet, @wideAlphabet
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @halfNumber, @wideNumber
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @halfSymbol, @wideSymbol
            editor.setTextInBufferRange(range, res.replacedText)
          else if type is 'wideAlphabetWithNumberToHalfAlphabetWithNumber'
            # 全角英数を半角英数に変換する
            replacedTextStatusMap = { }
            res = @replaceText text, replacedTextStatusMap, @wideAlphabet, @halfAlphabet
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @wideNumber, @halfNumber
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @wideSymbol, @halfSymbol
            editor.setTextInBufferRange(range, res.replacedText)
          else if type is 'halfAlphabetWithNumberToWideAlphabetWithNumber'
            # 半角英数を全角英数に変換する
            replacedTextStatusMap = { }
            res = @replaceText text, replacedTextStatusMap, @halfAlphabet, @wideAlphabet
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @halfNumber, @wideNumber
            res = @replaceText res.replacedText, res.replacedTextStatusMap, @halfSymbol, @wideSymbol
            editor.setTextInBufferRange(range, res.replacedText)
          else if type is 'wideKanaToHalfKana'
            # 全角カタカナを半角カタカナに変換する
            replacedTextStatusMap = { }
            res = @replaceText text, replacedTextStatusMap, @wideKana, @halfKana
            editor.setTextInBufferRange(range, res.replacedText)
          else if type is 'halfKanaToWideKana'
            # 半角カタカナを全角カタカナに変換する
            replacedTextStatusMap = { }
            res = @replaceText text, replacedTextStatusMap, @halfKana, @wideKana
            editor.setTextInBufferRange(range, res.replacedText)
          else if type is 'halfKanaToHiragana'
            # 半角カタカナをひらがなに変換する
            replacedTextStatusMap = { }
            res = @replaceText text, replacedTextStatusMap, @halfKana, @hiragana
            editor.setTextInBufferRange(range, res.replacedText)

  ###
  指定した文字の置き換え後の文字を取得する
  @param ch 置き換え前の文字
  @param beforeTbl 置き換え前のテキストテーブル
  @param afterTbl 置き換え後のテキストテーブル
  @return 置き換え後の文字
  ###
  findReplaceCharacter: (ch, beforeTbl, afterTbl) ->
    replacedCh = ''

    for i in [0..beforeTbl.length - 1]

      if ch is beforeTbl[i]
        # 置き換え前の文字が見つかったので置き換え後の文字を得る
        replacedCh = afterTbl[i]
        # 置き換え後の文字が得られたのでループを抜ける
        break

    return replacedCh

  ###
  指定したテキストを置き換えます。
  @param text 置き換え前のテキスト
  @param replacedTextStatusMap 置き換え処理済みか否かの状態を保持するマップ
  @param beforeTbl 置き換え前のテキストテーブル
  @param afterTbl 置き換え後のテキストテーブル
  @return 置き換え後の文字列と置き換え処理済みか否かの状態を保持するマップ
  ###
  replaceText: (text, replacedTextStatusMap = { }, beforeTbl, afterTbl) ->
    res =
      # 置き換え後の文字列
      replacedText: ''
      # 置き換え処理済みか否かの状態を保持するマップ
      replacedTextStatusMap: { }

    i = 0
    replaceIndex = 0
    res.replacedTextStatusMap = replacedTextStatusMap

    # テキストを１文字ずつ置き換えていく
    while i < text.length
      # １文字取得する
      ch = text.substring(i, i + 1)

      if (res.replacedTextStatusMap[i] is undefined) or (res.replacedTextStatusMap[i] is false)
        # 文字列置き換え処理がまだされていない場合、文字列置き換え処理を行う
        findCh = ch
        nextCh = ''

        if (i + 1) < text.length
          # 次の文字を取得する
          nextCh = text.substring(i + 1, i + 2)

          if nextCh is 'ﾞ' or nextCh is 'ﾟ'
            # 次の文字が濁点又は半濁点の場合は濁点又は半濁点を付けて検索する
            findCh = ch + nextCh

        # 置き換え前のテキストテーブルから文字を探す
        replacedCh = @findReplaceCharacter findCh, beforeTbl, afterTbl
        if (not (replacedCh is '')) and (nextCh is 'ﾞ' or nextCh is 'ﾟ')
          # 次の文字が濁点又は半濁点の場合は一つ飛ばす
          i++

        if replacedCh is ''
          # 置き換え後の文字がない場合はそのままの文字
          replacedCh = ch
          res.replacedTextStatusMap[replaceIndex] = false
        else
          res.replacedTextStatusMap[replaceIndex] = true

        res.replacedText = res.replacedText + replacedCh
        replaceIndex++
      else
        # 文字列置き換え処理が終わっている場合は文字列置き換え処理を行わない
        res.replacedText = res.replacedText + ch

      i++

    return res
