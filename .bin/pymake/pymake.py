#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os

def srch_make(dir_path):
    dir_p = dir_path
    dir_list = dir_path.split("/")
    src = dir_path
    target = ""

    status = False
    ch_make = False
    ch_build = False

    for i, _dir in enumerate(dir_list):
        ch_make = False
        ch_build = False
        if os.path.isdir(os.path.join(dir_p,"build")):
            ch_build = True
            # print ("OK-build")
        if os.path.isfile(os.path.join(dir_p,"Makefile")):
            ch_make = True
            # print("OK-make")
        
        if status == True and (ch_make == False or ch_build == False):
            # 1つまえの階層になければメインは１つ先
            # print ("back "+ dir_p + target)            
            return dir_p + target
        if status == False and (ch_make == True or ch_build == True):
            # 初発見
            if ch_make == True:
                # print("Find-make")
                pass
            if ch_build == True:
                # print("Find-build")
                return os.path.join(dir_p,"build")
            
            status = True

        # １つ前の階層に移動
        dir_p = ""
        target = dir_list[-2]
        for _path in dir_list[:-2]:
            dir_p += _path + "/"
        del dir_list[-1]
        
    return dir_path

if __name__ == '__main__':
    # sys.argv[0] 実行ファイル名
    # sys.argv[1] 第1引数

    # 引数1つ
    if  len(sys.argv) == 2:
        src = srch_make(sys.argv[1])
        cmd = "cd " + src + "&& make -j"
        os.system( cmd )

    # 引数2つ
    if  len(sys.argv) == 3:
        cmd = "cd " + sys.argv[1] + "&& make -j"
        os.system( cmd )
