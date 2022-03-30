function dab -d "Forcefully delete all local branches except master"
    set start_dir (pwd)
    if [ (count $argv) != 1 ]
        echo "Provide a path to the directory containing the repositories."
        return 1
    end
    if read_confirm
        set path $argv[1]
        echo $path
        set failed_paths
        for d in $path/*/
            cd $d
            set failure false
            set_color -o fc05cf
            echo -e "$d:"
            set_color normal
            git checkout go.mod go.sum 1>/dev/null 2>&1
            if git status | grep -q "nothing to commit"
                git branch | grep -v master | xargs git branch -D
                if [ $status != 0 ]
                    set -a failed_paths $d
                end
            else
                set -a failed_paths $d
                echo "Skipping due to work in progress..."
            end
        end
        set_color -o 05d3fc
        echo -e "Unable to complete at: "
        set_color normal
        echo $failed_paths
        cd $start_dir
    end

end
