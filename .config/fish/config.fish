if status is-interactive
    zoxide init fish | source
end
function fish_greeting
	fortune | cowsay -r
end
