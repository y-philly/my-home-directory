setlocal sw=4 ts=4 sts=4 noet

let g:go_fmt_command = "goimports"

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
