# Logic to run when the working directory changes
function pwd_onchange_hooks -v PWD
    echo onchange baby
    _nvm_use_configured_version
end
