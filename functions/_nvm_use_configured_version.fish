# Look for an .nvmrc file in the current working directory, or the git root
# If found, switch to the configured version if it differs from the active version
# Otherwise, switch to the default version if it is configured
function _nvm_use_configured_version
    # Check in CWD
    if test -e .nvmrc
        set -f nvmrc_path .nvmrc
    # Check at git root
    else if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        and set -f git_root (git rev-parse --show-toplevel)
        and test -e $git_root/.nvmrc

        set -f nvmrc_path $git_root/.nvmrc
    end

    # If not found, ensure we're using the system default
    if not set -q nvmrc_path
        set -q nvm_default_version && nvm use $nvm_default_version --silent
        return
    end

    # Switch only if our active version differs from expected
    set -f expected_version (cat $nvmrc_path)
    test "$expected_version" != "$nvm_current_version" && nvm use $expected_version
end
