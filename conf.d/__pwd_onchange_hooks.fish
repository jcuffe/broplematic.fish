# Logic to run when the working directory changes
function pwd_onchange_hooks -v PWD
    # Manage NodeJS version with nvm and .nvmrc files
    _nvm_use_configured_version
end
