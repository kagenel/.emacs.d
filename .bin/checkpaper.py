#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os

def bangruby(text, markS, markE):
    st = 0
    ed = 0

    while True:

        st = text.find(markS, st, len(text))
        if st < 0:
            break
        ed = text.find(markE, st, len(text))

        st += len(markS)

        print(text[st:ed])
        #del text[st:ed]

        GetLineNumberStr(text, text[st:ed])

    return text

def GetLineNumberStr(_texsouce, src):
    line_num = 0
    ch = False
    for line in _texsouce.split(os.linesep): # osの改行コードで分割
        line_num += 1
        index = line.find(src)
        if index >= 0:
            print (src + " -> L" + str(line_num) + ", " + str(index))
            ch = True

    return ch

def ChkBanTerm(textsouce):
    BanlistText = [ ["予め","あらかじめ"], ["あらわす","表す"], ["表わす","表す"], ["言う","いう"], ["１次元","一次元"], ["２次元","二次元"], ["３次元","三次元"], ["幾つか","いくつか"], ["及び","および"], ["およぼす","及ぼす"], ["各々","おのおの"], ["行なう","行う"], ["行なった","行った"], ["関わる","かかわる"], ["係わる","かかわる"], ["拘わる","かかわる"], ["きわめて","極めて"], ["較べる","比べる"], ["繰返す","繰り返す"], ["組合せ","組み合わせ"], ["組替える","組み替える"], ["事","こと"], ["毎","ごと"], ["更に","さらに"], ["従って","したがって"], ["にしたがい","に従い"], ["充分","十分"], ["既に","すでに"], ["即ち","すなわち"], ["総て","すべて"], ["全て","すべて"], ["直ぐに","すぐに"], ["但し","ただし"], ["例え","たとえ"], ["たとえば","例えば"], ["つぎに","次に"], ["出来る","できる"], ["著者","筆者"], ["時に","ときに"], ["とくに","特に"], ["留まる","とどまる"], ["止まる","とどまる"], ["伴なう","伴う"], ["無い","ない"], ["等","など"], ["並びに","ならびに"], ["を始めとして","をはじめとして"], ["１つ","一つ"], ["1つ","一つ"], ["２つ","二つ"], ["2つ","二つ"], ["３つ","三つ"], ["3つ","三つ"], ["ひとり","一人"], ["殆ど","ほとんど"], ["又は","または"], ["全く","まったく"], ["稀","まれ"], ["充たす","満たす"], ["むずかしい","難しい"], ["もとづく","基づく"], ["尤も","もっとも"], ["もっとも","最も"], ["し易い","しやすい"], ["呼ぶ","よぶ"], ["様だ","ようだ"], ["ゆく","いく"], ["解る","分かる"], ["判る","分かる"], ["僅か","わずか"], ["われわれ","我々"], ["言える", "いえる"]  ]

    for check in BanlistText:
        if GetLineNumberStr(textsouce, check[0]):
            print ("--->" + str(check[1]))
        #print("BAN : " + str(check[0]) + " Rev : " + str(check[1]))

def checkRSJ(souce_path):

    print ("check " + souce_path)
    textsouce = ""

    with open(souce_path, 'r', encoding='utf_8') as f:
      textsouce = f.read()

    ChkBanTerm(textsouce)

def checkRSJ_dirs(dir_path):

    files = os.listdir(dir_path)

    src = dir_path+"/"
    for file in files:
        # ファイルパスが存在するかどうかの判定
        if os.path.isfile(src + file):
            #print("パスはファイルです。")
            checkRSJ(src + file)    
        else:
            #print(src + file)
            checkRSJ_dirs(src + file)  # 再帰的に見るのに注意

if __name__ == '__main__':
    # sys.argv[0] 実行ファイル名
    # sys.argv[1] 第1引数
    #print(sys.argv[0])
    #print(sys.argv[1])

    # オプション
    # -d   : ディレクトリ内のファイルをチェック
    # -rsj : ロボット学会フォーマットでチェック
    
    soucefile = "main.tex"
    if len(sys.argv) == 1:
        print ("コマンド引数が足りません")
    else:
        if  len(sys.argv) == 2:
            print ("check " + str(sys.argv[1]) )
            soucefile = sys.argv[1]
            checkRSJ(soucefile)

        elif sys.argv[1] == '-d':
            print ("check " + str(sys.argv[2]) )
            soucefile = sys.argv[2]
            checkRSJ_dirs(soucefile)

    #print(textsouce)
    #textsouce = bangruby(textsouce, "{", "}")

    # with open("wordmaketxt.txt", 'w', encoding="utf_8") as f:
    #     f.write(textsouce)
