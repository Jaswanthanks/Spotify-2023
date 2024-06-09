SELECT * FROM spotify.`spotify-2023`;

# BEGINNER LEVEL :

# 1. Select all records from the dataset.
SELECT * FROM spotify.`spotify-2023`;

# 2 .Select the track_name, artist_name, and streams columns.
SELECT `track_name` , `artist(s)_name` , `streams` 
from spotify.`spotify-2023`;

# 3. **Find all songs released in the year 2023.**
select `track_name` , `artist(s)_name` , `released_year`
from spotify.`spotify-2023`
where `released_year` = 2023;

# 4. **Count the number of songs released in the year 2023.**
select count(`track_name`) as number_of_songs , `artist(s)_name` , `released_year`
from spotify.`spotify-2023`
where `released_year` = 2023
group by `artist(s)_name` 
order by  count(`track_name`) desc;

# 5. **Order songs by the number of streams in descending order.**
select `track_name` , `artist(s)_name` , count(`streams`) as total_count
from spotify.`spotify-2023`
group by `track_name` , `artist(s)_name` 
order by total_count desc;

# 6. **Find the song with the highest number of streams.**
select `track_name` , `artist(s)_name` , count(`streams`)as total_count
from spotify.`spotify-2023`
group by `track_name` , `artist(s)_name` 
order by total_count desc
limit 1;

# 7. **Calculate the average number of streams for all songs.**
select `track_name` , `artist(s)_name` , round(avg(`streams`)) as round_total_count
from spotify.`spotify-2023`
group by `track_name` , `artist(s)_name` 
order by round_total_count desc;

# 8. **List the names of songs that are in the Spotify charts.**
select `artist(s)_name` , `track_name` ,`in_spotify_charts`
from spotify.`spotify-2023`
where `in_spotify_charts` > 0
order by `in_spotify_charts` desc;

# 9. **Select songs where `mode` is 'Major'.**
select `artist(s)_name` , `track_name` , `mode`
from spotify.`spotify-2023`
where `mode` = 'Major';

# 10. **Find songs with `danceability` greater than 70%.**
select `artist(s)_name` , `track_name` , `danceability_%`
from spotify.`spotify-2023`
where `danceability_%` > 70
order by `danceability_%` desc;

# INTERMEDIATE LEVEL:

# 1. **Find the total number of streams for each artist.**
select `artist(s)_name`  , count(`streams`) as tot_streams
from spotify.`spotify-2023`
group by `artist(s)_name`
order by tot_streams desc;

# 2. **Group songs by `released_year` and count the number of songs for each year.**
select `artist(s)_name` , count(`track_name`) as tot_tracks  , `released_year` 
from spotify.`spotify-2023`
group by `released_year` , `artist(s)_name`
order by tot_tracks desc ;

# 3. **Find the average `valence` for songs released in 2023.**
select round(avg(`valence_%`)) as avg_valence , `released_year` , `track_name`
from spotify.`spotify-2023`
where `released_year`  = 2023
group by  `released_year` , `track_name`
order by avg_valence desc;

# 4. **Find the song with the highest `bpm`.**
select `track_name` , `artist(s)_name` , `bpm`
from spotify.`spotify-2023`
group by `track_name` , `artist(s)_name` , `bpm`
order by `bpm` desc;

# 5. **Select the top 5 songs with the highest `energy`.**
select `track_name` , `artist(s)_name`  , `energy_%`
from spotify.`spotify-2023`
group by `track_name` , `artist(s)_name`  , `energy_%`
order by `energy_%` desc
limit 5;	

# 6. **List all songs with `streams` greater than 100 million.**
select * from spotify.`spotify-2023`
where `streams` >100000000;

# 7. **Find the total number of playlists (across all platforms) that each song is in.**
select `track_name` , `artist(s)_name`,count(`in_spotify_playlists`) as count_Spotify_playlist , count(`in_apple_playlists`) as Count_apple_playlist , count(`in_deezer_playlists`) as count_deezer_playlist
from spotify.`spotify-2023`
group by `track_name` , `artist(s)_name`
order by count_Spotify_playlist desc;

# 8. **Count the number of songs that are in both Spotify and Apple playlists.**
select `track_name` , `artist(s)_name` , `in_spotify_playlists` , `in_apple_playlists`
from spotify.`spotify-2023`
WHERE in_spotify_playlists > 0 AND in_apple_playlists > 0;

# 9. **Calculate the percentage of songs in the dataset that are in a `minor` key.**
SELECT 
    (SUM(CASE WHEN mode = 'Minor' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_minor_key
from spotify.`spotify-2023`;

# 10. **Find songs where `speechiness` is less than 10%.*
select * from spotify.`spotify-2023`
where `speechiness_%` < 10;

# ADVANCE LEVEL:

# 1. **Identify the artist with the most songs in the dataset.**
select count(`track_name`) as tot_songs , `artist(s)_name`
from spotify.`spotify-2023`
group by `artist(s)_name`
order by tot_songs desc
limit 5;

# 2. **Find the artist with the highest average number of streams per song.**
select `track_name` , `artist(s)_name` , round(avg(`streams`)) as avg_streams
from spotify.`spotify-2023`
group by `track_name` , `artist(s)_name`
order by avg_streams desc;

# 3. **Calculate the average `danceability`, `energy`, and `acousticness` for songs in a `minor` key.**
select round(avg(`danceability_%`)) as avg_danceability , 
round(avg(`energy_%`)) as avg_energy , 
round(avg(`acousticness_%`)) as avg_acousticness
from spotify.`spotify-2023`
where mode = 'Minor';

# 4. **List songs that appear in the top 10 of Shazam charts but not in Spotify charts.**
select `track_name` , `artist(s)_name` , `in_spotify_charts` ,`in_shazam_charts`
from spotify.`spotify-2023`
where `in_shazam_charts` > 10 and (`in_spotify_charts` <= 10 or `in_spotify_charts` is null);

# 5. **Find the total number of streams for each year, ordered by year.**
select count(`streams`) as total_streams , `released_year`
from spotify.`spotify-2023`
group by `released_year`
order by `released_year` desc;


# 6. **Identify the songs that are in the top 10 of Deezer charts and the top 20 of Apple charts.**
select `track_name` , `artist(s)_name` , `in_spotify_charts` ,`in_shazam_charts`
from spotify.`spotify-2023`
where `in_apple_charts` > 20 and `in_deezer_charts` > 10;

# 7. **Find the song with the highest `instrumentalness`.**
select  `track_name` , `artist(s)_name` , `instrumentalness_%`
from spotify.`spotify-2023`
group by `track_name` , `artist(s)_name` , `instrumentalness_%`
order by `instrumentalness_%` desc
limit 1;

# 8. **Calculate the average `liveness` for songs in the dataset.**
select `track_name` , `artist(s)_name` , avg(`liveness_%`) as avgliveness
from spotify.`spotify-2023`
group by `track_name` , `artist(s)_name` 
order by avgliveness;

# 9. **List the names of all songs released in the month of March.**
select * from spotify.`spotify-2023`
where `released_month` = 3;
