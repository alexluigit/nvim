command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

command! StripWhitespace %s/\s\+$//e
