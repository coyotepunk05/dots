function pacman --description 'alias pacman=systemd-inhibit --what=idle --why="pacman is running" pacman'
    systemd-inhibit --what=idle --why="pacman is running" pacman $argv
end
