# Look for an .nvmrc file in the current working directory, or the git root
# If found, compare the configured NodeJS version with the active version
# Switch to the configured version with if they differ
function _nvm_use_configured_version
    echo using configured version
    # Check in CWD
    if test -e .nvmrc
        set -f nvmrc_path .nvmrc
    end

    # Check at git root
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        and set -l git_root (git rev-parse --show-toplevel >/dev/null 2>&1)
        and test -e $git_root/.nvmrc

        set -f nvmrc_path $git_root/.nvmrc
    end

    # Do nothing if not found
    if not set -q nvmrc_path
        echo not found
        return
    end

    set -f nvmrc_version (cat $nvmrc_path)
    echo attempting switch to $nvmrc_version

    if test "$nvmrc_version" = "$nvm_current_version"
        echo same version
        return
    end

    nvm use $nvmrc_version
end
