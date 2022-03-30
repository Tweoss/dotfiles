function xar -d "xar <parent directory> <cmd> <args>; Execute a command in all directories given the root"
    set start_dir (pwd)
    set num (count $argv)
    echo $num
    if [ $num -eq 1 -o $num -eq 0 ]
	echo "Provide a directory and a command to execute"
	return 1
    end

    set path $argv[1]
    set cmd $argv[2..-1]
    for d in $path/*/
        cd $d
        set_color -o fc05cf
        echo -e "$d"
        set_color normal
	eval $cmd
    end
    cd $start_dir
    return 0
end
