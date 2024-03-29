{
  programs.nano = {
    enable = true;
    syntaxHighlight = true;
    nanorc = ''
    # Generl Settings
    set afterends
    set atblanks
    set constantshow
    set cutfromcursor
    set emptyline
    set locking
    set mouse
    set multibuffer
    set nohelp
    set positionlog
    set regexp
    set showcursor
    set smarthome
    set unix
    set zap
    
    # Indentation
    set autoindent
    set tabsize 2
    set softwrap
    
    # UI/UX
    #set linenumbers
    set minibar
    set stateflags
    
    # Whitespace
    set tabstospaces
    set trimblanks
    
    # Colors:
    # set <variable>  bold,italic,fg,bg
    set errorcolor    bold,red,normal
    set functioncolor italic,normal,normal
    set keycolor      bold,lime,normal
    set promptcolor   bold,mint,black
    set minicolor     bold,mint,black
    set numbercolor   bold,white,normal
    set statuscolor   lime,normal
    set selectedcolor brightblack,white
    set titlecolor    brightwhite,normal
    
    # Code Format
    extendsyntax nix formatter nixfmt #alejandra
    extendsyntax sh  formatter shfmt
    '';
  };
}
