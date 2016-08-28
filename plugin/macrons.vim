if exists('loaded_macrons_plugin')
	finish
endif
let loaded_macrons_plugin = 1

scriptencoding utf-8

function! s:Demacronize() range
    let l:winview = winsaveview()

    for linenum in range(a:firstline, a:lastline)
	    let start_line = getline(linenum)
	    let replacement = tr(start_line, 'ĀĒĪŌŪȲāēīōūȳ', 'AEIOUYaeiouy')
	    call setline(linenum, replacement)
    endfor

    call winrestview(l:winview)
endfunction

command! -range=% Demacronize <line1>,<line2>call <SID>Demacronize()

function! s:Macronize() range
    let l:winview = winsaveview()

    for linenum in range(a:firstline, a:lastline)
	    let start_line = getline(linenum)
	    let replacement = tr(start_line, 'AEIOUYaeiouy', 'ĀĒĪŌŪȲāēīōūȳ')
	    call setline(linenum, replacement)
    endfor

    call winrestview(l:winview)
endfunction

command! -range=% Macronize <line1>,<line2>call <SID>Macronize()

function! s:CharMacronFlip()
	let l:old = matchstr(getline('.'), '\%' . col('.') . 'c.')
	if l:old == "a"
		normal! rā
	elseif l:old == "e"
		normal! rē
	elseif l:old == "i"
		normal! rī
	elseif l:old == "o"
		normal! rō
	elseif l:old == "u"
		normal! rū
	elseif l:old == "y"
		normal! rȳ
	elseif l:old == "A"
		normal! rĀ
	elseif l:old == "E"
		normal! rĒ
	elseif l:old == "I"
		normal! rĪ
	elseif l:old == "O"
		normal! rŌ
	elseif l:old == "U"
		normal! rŪ
	elseif l:old == "Y"
		normal! rȲ
	elseif l:old == "ā"
		normal! ra
	elseif l:old == "ē"
		normal! re
	elseif l:old == "ī"
		normal! ri
	elseif l:old == "ō"
		normal! ro
	elseif l:old == "ū"
		normal! ru
	elseif l:old == "ȳ"
		normal! ry
	elseif l:old == "Ā"
		normal! rA
	elseif l:old == "Ē"
		normal! rE
	elseif l:old == "Ī"
		normal! rI
	elseif l:old == "Ō"
		normal! rO
	elseif l:old == "Ū"
		normal! rU
	elseif l:old == "Ȳ"
		normal! rY
	endif
	silent! call repeat#set("\<Plug>CharMacronFlip", -1)
endfunction

function! s:MacronFlip(direction)
	" direction 0 = macrons->no-macrons; 1 = no-macrons->macrons
	silent normal! gvy
	let l:text = getreg(v:register)

	let l:winview = winsaveview()
	if a:direction == 0 " remove macrons
		let l:text = tr(l:text, 'ĀĒĪŌŪȲāēīōūȳ', 'AEIOUYaeiouy')
	else " add macrons
		let l:text = tr(l:text, 'AEIOUYaeiouy', 'ĀĒĪŌŪȲāēīōūȳ')
	endif

	call setreg(v:register, l:text, mode())
	silent normal! gvp
endfunction

nnoremap <unique><silent> <Plug>CharMacronFlip
	\ :call <SID>CharMacronFlip()<CR>
vnoremap <unique> <Plug>MacronsOff :<C-u>call <SID>MacronFlip(0)<CR>
vnoremap <unique> <Plug>MacronsOn :<C-u>call <SID>MacronFlip(1)<CR>
