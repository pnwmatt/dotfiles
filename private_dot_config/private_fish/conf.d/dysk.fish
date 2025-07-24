if type -q dysk
    if status is-interactive
        alias dysk='dysk --filter "type <> nfs4"'
    end
end
