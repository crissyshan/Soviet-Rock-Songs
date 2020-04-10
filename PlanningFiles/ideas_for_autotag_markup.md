# Auto-tagging ideas

By no means complete, but these are some extremely common ones that it is easy to scan for before starting close reading.

земл(я|ю|и|е)--<nature>\0</nature>
вода((а|и)--<nature>\0</nature>
рек(а|и|е)--<nature>\0</nature>
ды(м|а|у)--<industry>\0</industry>
планет(е|а|у|ам|ах|и|ой|ами)-- <nature>\0</nature>
ручь(ей|я) -- <nature>\0</nature>
машин(а|и|е|ах|ой|ами)<industry>\0</industry>
трав(а|е|ой)--<nature>\0</nature>
звезд(у|ы|е|а|ах|ой|ами)--<nature>\0</nature>
снег(у|а)--<nature>\0</nature>
солнц(е|а)--<nature>\0</nature>
спасти--<defense>\0</defense>
люд(и|ей|ями|ям)--<community>\0</community>
дет(и|ей|ями|ям)--<community>\0</community>
дру(з|г)(ья|а|у|ям|ей|ями|ом)--<community>\0</community>
заря--<nature>\0</nature>
опять--<time>\0</time>
День--<time>\0</time>
дн(и|я|ей)--<time>\0</time>
ночь--<time>\0</time>
за часом час--<time>\0</time>
Каждый день--<time>\0</time>
Меня(е|ю)(т|м)?(ся|сь)--<change>\0</change>
перемен--<change>\0</change>
нов(ы|а)(й|я|е|х)--<change>\0</change>
в добрый час--<hope>\0</hope>
не зря--<hope>\0</hope>
дорог(а|и|ах|е)--<industry>\0</industry> OR <change>\0</change>
народ(н)?(ы|а)?(я|е|й)?--<community ref="folk">\0</community>
церк(овь|ви)--<community ref="religion">\0</community>
