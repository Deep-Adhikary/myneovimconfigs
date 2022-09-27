" Declare the list of plugin
" Condition check function
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.local/share/nvim/plugged')
" Declare the list of plugins.
" LSP Config
Plug 'neovim/nvim-lspconfig', Cond(!exists('g:vscode'))
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', Cond(!exists('g:vscode'), {'do': ':TSUpdate'}) 
" Telescope Dependancies
Plug 'nvim-lua/plenary.nvim', Cond(!exists('g:vscode'))
Plug 'BurntSushi/ripgrep', Cond(!exists('g:vscode'))
Plug 'sharkdp/fd', Cond(!exists('g:vscode'))
"DevIcons
Plug 'kyazdani42/nvim-web-devicons', Cond(!exists('g:vscode'))
" Telescope
Plug 'nvim-telescope/telescope.nvim', Cond(!exists('g:vscode'), { 'tag': '0.1.0' })
"nvim tree
Plug 'kyazdani42/nvim-tree.lua', Cond(!exists('g:vscode'))
"nvim cmp
"A completion engine plugin for Neovimm written in Lua
Plug 'hrsh7th/cmp-nvim-lsp', Cond(!exists('g:vscode'))
Plug 'hrsh7th/cmp-buffer', Cond(!exists('g:vscode'))
Plug 'hrsh7th/cmp-path', Cond(!exists('g:vscode'))
Plug 'hrsh7th/cmp-cmdline', Cond(!exists('g:vscode'))
Plug 'hrsh7th/nvim-cmp', Cond(!exists('g:vscode'))

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip', Cond(!exists('g:vscode'))
Plug 'hrsh7th/vim-vsnip', Cond(!exists('g:vscode'))
" Editor Config
Plug 'editorconfig/editorconfig-vim', Cond(!exists('g:vscode'))
" ALE
Plug 'dense-analysis/ale', Cond(!exists('g:vscode'))
" HOP
Plug 'phaazon/hop.nvim', Cond(!exists('g:vscode'))
" Diff View
Plug 'sindrets/diffview.nvim', Cond(!exists('g:vscode'))
" Nerd Commenter
Plug 'preservim/nerdcommenter', Cond(!exists('g:vscode'))
" Lua Line
Plug 'nvim-lualine/lualine.nvim', Cond(!exists('g:vscode'))
" indent_blankline n
Plug 'lukas-reineke/indent-blankline.nvim', Cond(!exists('g:vscode'))
" Barbar
Plug 'romgrk/barbar.nvim', Cond(!exists('g:vscode'))
" Nvim JDLTS
Plug 'mfussenegger/nvim-jdtls', Cond(!exists('g:vscode'))
" Dracula Theme
Plug 'Mofiqul/dracula.nvim', Cond(!exists('g:vscode'))
" Vscode neovim plugins
" use vscode easymotion when in vscode mode
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
call plug#end()

if exists('g:vscode')
    " VSCode extension
else
    " ordinary Neovim
    "**********************LUA Config Imports*******************
    lua require('deepconfigs')
    "***********************Editor Configs*********************
    set number
    set tabstop=4
    set shiftwidth=4
    set expandtab
    colorscheme dracula
    set clipboard=unnamed
    "Terminal:
    "Map <Escape> in Terminal Exit
    :tnoremap <Esc> <C-\><C-n>
    let s:termtoggle=0
    function! OpenTerminal()
        if s:termtoggle
            q!
            let s:termtoggle=0
        else
            belowright split
            resize 12
            set nonumber
            terminal
            let s:termtoggle=1
        endif
    endfunction
    :command ToggleTerminal  call OpenTerminal()
    nmap <silent> <C-t> :ToggleTerminal<CR>
    "***********Telescope Configuration*************************
    " Find files using Telescope command-line sugar.
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

    "*****************nvim cmp configurations******************************************
    set completeopt=menu,menuone,noselect

    " *******************Nerd Commenter Settings**************************
    " Create default mappings
    let g:NERDCreateDefaultMappings = 1

    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1

    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'

    " Set a language to use its alternate delimiters by default
    let g:NERDAltDelims_java = 1

    " Add your own custom formats or override the defaults
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1

    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1

    " Enable NERDCommenterToggle to check all selected lines is commented or not 
    let g:NERDToggleCheckAllLines = 1
    "********************barbar optiions**********************************
    " Move to previous/next
    nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
    nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
    " Re-order to previous/next
    nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
    nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
    " Goto buffer in position...
    inoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
    inoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
    inoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
    inoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
    inoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
    inoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
    nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
    nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
    nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
    nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
    " Pin/unpin buffer
    nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
    " Close buffer
    nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
    " Wipeout buffer
    "                          :BufferWipeout
    " Close commands
    "                          :BufferCloseAllButCurrent
    "                          :BufferCloseAllButPinned
    "                          :BufferCloseAllButCurrentOrPinned
    "                          :BufferCloseBuffersLeft
    "                          :BufferCloseBuffersRight
    " Magic buffer-picking mode
    nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
    " Sort automatically by...
    nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
    nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
    nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
endif
