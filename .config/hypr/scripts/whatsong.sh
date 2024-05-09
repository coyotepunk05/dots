# script for hyprlock spotify integration
# graciously provided (stolen) from justinmdickey

song_info=$(playerctl metadata --format '{{title}}  {{artist}}')

echo "$song_info" 
