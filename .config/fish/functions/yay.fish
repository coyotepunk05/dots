function yay --description 'alias yay=systemd-inhibit --what=idle --why="pacman is running" yay'
    systemd-inhibit --what=idle --why="pacman is running" yay $argv
end
