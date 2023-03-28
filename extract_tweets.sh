#!/bin/bash

OUTPUT_DIRECTORY="./tweetsfinal"
mkdir -p "$OUTPUT_DIRECTORY"

# set the day and hour to extract tweets from
day="05"
hour="16"

# loop through each year from 2010 to 2023
for year in $(seq 2010 2023); do
  # loop through the months we want to extract tweets from
  for month in $(seq -w 1 12); do
    # construct the path to the tweet file for the specified date and hour
    tweet_file="/net/corpora/twitter2/Tweets/${year}/${month}/${year}${month}${>
    # check if a file exists for the current month and hour
    if ls $tweet_file >/dev/null 2>&1; then
      # if a file exists, extract the text from each tweet and save it to a file
      output_file="$OUTPUT_DIRECTORY/${year}-${month}-${day}-${hour}.txt"
      echo "Extracting tweets from $year-$month-$day-$hour"
      zless $tweet_file | /net/corpora/twitter2/tools/tweet2tab text > "$output>
    else
      echo "No tweet file found for $year-$month-$day-$hour"
    fi
  done
done

echo "All tweets extracted and saved to $OUTPUT_DIRECTORY"

