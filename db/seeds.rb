require 'open-uri'


cowboys = Team.create!(city: "Dallas", nickname: "Cowboys", colors: "Blue, Silver, White", email: "dallas@cowboys.com", logo: URI.parse("https://s3.us-east-2.amazonaws.com/dbc-space-app/teams/logos/000/000/001/original/dallas.png"))
eagles = Team.create!(city: "Philidelphia", nickname: "Eagles", colors: "Dark Green, Gold, White", email: "philidelhpia@eagles.com", logo: URI.parse("https://s3.us-east-2.amazonaws.com/dbc-space-app/teams/logos/000/000/002/original/phili.png"))
giants = Team.create!(city: "New York", nickname: "Giants", colors: "Dark Blue, Red, White", email: "newyork@giants.com", logo: URI.parse("https://s3.us-east-2.amazonaws.com/dbc-space-app/teams/logos/000/000/003/original/giants.png"))
redskins = Team.create!(city: "Washington D.C.", nickname: "Redskins", colors: "Teal, Black, Gold, White", email: "washington@redskins.com", logo: URI.parse("https://s3.us-east-2.amazonaws.com/dbc-space-app/teams/logos/000/000/004/original/redskins.png"))
texans = Team.create!(city: "Houston", nickname: "Texans", colors: "Nave, Red, Silver, White", email: "houston@texans.com", logo: URI.parse("https://s3.us-east-2.amazonaws.com/dbc-space-app/teams/logos/000/000/005/original/texans.png"))

Position.create!(name: "Center", description: "performs the normal blocking functions of all linemen and is the player who puts the ball in play by means of the snap", code: "C") 
Position.create!(name: "Defensive tackle", description: "rush the passer, and stop running plays directed at the middle of the line of scrimmage", code: "DT") 
Position.create!(name: "Defensive end", description: "attack the passer or stop offensive runs to the outer edges of the line of scrimmage", code: "DE") 
Position.create!(name: "Defensive back", description: "rush the passer, and stop running plays directed at the middle of the line of scrimmage", code: "DB") 
Position.create!(name: "Cornerback", description: "attempt to prevent successful quarterback passes", code: "CB") 
Position.create!(name: "Free safety", description: "last line of defense and usually help the corners with deep-pass coverage", code: "FS") 
Position.create!(name: "Kicker", description: "handles kickoffs and field goal attempts", code: "K") 
Position.create!(name: "Fullback", description: "may do some running, some blocking, and some short receiving", code: "FB") 
Position.create!(name: "Long snapper", description: "snaps the ball directly to the holder", code: "LS") 
Position.create!(name: "Linebacker", description: "rushing the passer, covering receivers, and defending against the run", code: "LB") 
Position.create!(name: "Outside linebacker", description: "rushing the passer, covering receivers, and defending against the run", code: "OLB") 
Position.create!(name: "Offensive guard", description: "block on both running and passing plays", code: "OG") 
Position.create!(name: "Offensive tackle", description: "block on both running and passing plays", code: "OT") 
Position.create!(name: "Middle linebacker", description: "rushing the passer, covering receivers, and defending against the run", code: "MLB") 
Position.create!(name: "Nose tackle", description: "clog up as much of the middle of the offensive line as possible to allow the other defensive players to make plays", code: "NT") 
Position.create!(name: "Punter", description: "kicks punts", code: "P") 
Position.create!(name: "Quarterback", description: "takes a snap from the center and then either hands off to a back, passes to a receiver or a back, or runs the ball himself", code: "QB") 
Position.create!(name: "Strong safety", description: "last line of defense and usually help the corners with deep-pass coverage", code: "SS") 
Position.create!(name: "Tight end", description: "mix between a blocker and a pass receiver", code: "TE") 
Position.create!(name: "Running back", description: "carries the ball on most running plays and is also frequently used as a short-yardage receiver", code: "RB") 
Position.create!(name: "Wide receiver", description: "speedy pass-catching specialists", code: "WR")


# phili eagles
# new york giants
# washington redskins
# houston texans



dallas_players = JSON.load(open("http://api.suredbits.com/nfl/v0/team/DAL/roster"))


dallas_players.each do | player |
	new_player = Player.new
	if player["status"] == "Active"
		new_player.number = player["uniformNumber"]
		new_player.first_name = player["firstName"]
		new_player.last_name = player["lastName"]
		new_player.team = cowboys
    new_player.positions << Position.where(code: player["position"])
    new_player.save!
	end
end


