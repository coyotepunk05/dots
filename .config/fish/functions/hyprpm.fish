function hyprpm --description 'alias hyprpm=systemd-inhibit --what=idle --why="hyprpm is running" hyprpm'
    systemd-inhibit --what=idle --why="hyprpm is running" hyprpm $argv
end
