### Enable ###
eval %sh{kak-lsp}
lsp-enable

set-option global modelinefmt "%opt{lsp_modeline} %opt{modelinefmt}"

### Mappings ###
map global user l ':enter-user-mode lsp<ret>' -docstring 'LSP mode'
map global goto d <esc>:lsp-definition<ret> -docstring 'LSP definition'
map global goto r <esc>:lsp-references<ret> -docstring 'LSP references'
map global goto y <esc>:lsp-type-definition<ret> -docstring 'LSP type definition'
map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'
map global object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
map global object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
map global object f '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
map global object t '<a-semicolon>lsp-object Class Interface Module Namespace Struct<ret>' -docstring 'LSP class or module'
map global object d '<a-semicolon>lsp-diagnostic-object error warning<ret>' -docstring 'LSP errors and warnings'
map global object D '<a-semicolon>lsp-diagnostic-object error<ret>' -docstring 'LSP errors'

### Hooks ###
# Default server hooks need to be removed first, then hooked to another server.
remove-hooks global lsp-filetype-sh

# Bash servers keep kak-lsp running after kak is closed.
# Disabled until further investigations.
#
# hook -group lsp-filetype-sh global BufSetOption filetype=(sh|bash) %{
#   set-option buffer lsp_servers %{
#     [bashd]
#     root_globs = [".git"]
#     command = "bashd"
#   }
# }

hook global WinSetOption filetype=(c|cpp) %{
  hook window -group semantic-tokens BufReload .* lsp-semantic-tokens
  hook window -group semantic-tokens NormalIdle .* lsp-semantic-tokens
  hook window -group semantic-tokens InsertIdle .* lsp-semantic-tokens
  hook -once -always window WinSetOption filetype=.* %{
    remove-hooks window semantic-tokens
  }
}

# Use Markdown-Oxide
remove-hooks global lsp-filetype-markdown
hook -group lsp-filetype-markdown global BufSetOption filetype=markdown %{
    set-option buffer lsp_servers %{
        [markdown-oxide]
        root_globs = [".obsidian", ".moxide.toml"]
    }
}
