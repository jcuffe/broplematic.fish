function sync_nvm_with_pwd -v PWD
    # Check for .nvmrc
    # TODO: use git to check the project root as well as the current directory
    if ! test -e .nvmrc
        return
    end

    # Check for nvm function
    # TODO: Ensure this logic is loaded after nvm
    if ! type -q nvm
        return
    end

    # Load the configured Node version for the current project
    nvm use
end
