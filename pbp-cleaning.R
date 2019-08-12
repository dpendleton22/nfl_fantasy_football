data <- read.csv("nfl-pbp-2016.csv")

columns_keep <- c("play_id", "game_id", "home_team", "away_team", "posteam", "posteam_type", "defteam", "yardline_100", "game_date", "ydsnet", "desc", "play_type", "yards_gained", "pass_length", "field_goal_result", "kick_distance", "extra_point_result", "two_point_conv_result", "td_team", "total_home_score", "total_away_score", "posteam_score", "defteam_score", "score_differential", "punt_blocked", "incomplete_pass", "interception", "fumble_forced", "fumble_not_forced", "safety", "tackled_for_loss", "fumble_lost", "own_kickoff_recovery_td", "rush_attempt", "pass_attempt", "sack", "touchdown", "pass_touchdown", "rush_touchdown", "extra_point_attempt", "return_touchdown", "two_point_attempt", "field_goal_attempt", "fumble", "complete_pass", "passer_player_id", "passer_player_name", "receiver_player_name", "receiver_player_id", "rusher_player_id", "rusher_player_name", "lateral_receiver_player_id", "lateral_receiver_player_name", "lateral_rusher_player_id", "lateral_rusher_player_name", "interception_player_id", "interception_player_name", "punt_returner_player_id", "punt_returner_player_name", "lateral_punt_returner_player_id", "lateral_punt_returner_player_name", "kickoff_returner_player_name", "kickoff_returner_player_id", "lateral_kickoff_returner_player_id", "lateral_kickoff_returner_player_name", "fumbled_1_team", "fumbled_1_player_id", "fumbled_1_player_name", "fumbled_2_player_id", "fumbled_2_player_name", "fumbled_2_team", "fumble_recovery_1_team", "fumble_recovery_1_player_id", "fumble_recovery_1_player_name", "fumble_recovery_2_team", "fumble_recovery_2_player_id", "fumble_recovery_2_player_name", "defensive_two_point_conv", "defensive_extra_point_conv")

data <- data[columns_keep]

data <- data[!is.na(data$posteam),]

View(data)

describe(data)

write.csv(data, "nfl-pbp-2016-cleaned.csv")