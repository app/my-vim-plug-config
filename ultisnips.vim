let s:source = {
    \ 'name' : 'ultisnips',
    \ 'kind' : 'keyword',
    \ 'mark' : '[US]',
    \ 'rank' : 8,
    \ 'matchers' :
        \ (g:neocomplete#enable_fuzzy_completion ?
        \ ['matcher_fuzzy'] : ['matcher_head']),
    \ 'min_pattern_length' : 1,
    \ 'max_candidates' : 20,
    \ }

function! s:source.gather_candidates(context)
    let suggestions = []
    for trigger in keys(UltiSnips#SnippetsInCurrentScope())
        let description = get(UltiSnips#SnippetsInCurrentScope(),
                    \ trigger)
        call add(suggestions, {
        \ 'word' : trigger,
        \ 'menu' : self.mark . ' '. description
        \ })
    endfor
    return suggestions
endfunction

function! neocomplete#sources#ultisnips#define()
    return s:source
endfunction
