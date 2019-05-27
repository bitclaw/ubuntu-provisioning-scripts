# If you add the following code to your .bashrc on a system
# with the default git bash completion scripts installed, it
# will automatically create completion-aware g<alias> bash
# aliases for each of your git aliases. The main downside to
# this approach is that it will make your terminal take a
# little longer to load.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion                                                                                                                                                                
fi

function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

for al in `__git_aliases`; do
    alias g$al="git $al"
    
    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done