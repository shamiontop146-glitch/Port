--!strict
export type Tier = { req: number, reward: number }

local Difficulties = { "Easy", "Medium", "Hard", "Impossible" }

local questTypes = {
	{
		id = "EliminatePlayers",
		displayName = "ELIMINATE %d PLAYERS",
		stat = "Eliminations",
		trackable = true,
		difficulties = {
			Easy = { { req = 15, reward = 60 }, { req = 20, reward = 80 }, { req = 25, reward = 100 } },
			Medium = { { req = 30, reward = 115 }, { req = 40, reward = 145 }, { req = 50, reward = 175 } },
			Hard = { { req = 75, reward = 220 }, { req = 100, reward = 295 }, { req = 125, reward = 415 } },
			Impossible = { { req = 150, reward = 470 }, { req = 200, reward = 555 }, { req = 250, reward = 750 } },
		},
	},
	{
		id = "PlayRounds",
		displayName = "PLAY %d ROUNDS",
		stat = "RoundsPlayed",
		trackable = true,
		difficulties = {
			Easy = { { req = 4, reward = 40 }, { req = 6, reward = 55 }, { req = 8, reward = 70 } },
			Medium = { { req = 10, reward = 85 }, { req = 15, reward = 110 }, { req = 20, reward = 140 } },
			Hard = { { req = 30, reward = 190 }, { req = 35, reward = 215 }, { req = 40, reward = 250 } },
			Impossible = { { req = 50, reward = 300 }, { req = 75, reward = 400 }, { req = 100, reward = 500 } },
		},
	},
	{
		id = "UseAbility",
		displayName = "USE YOUR ABILITY %d TIMES",
		stat = "AbilityUses",
		trackable = true,
		difficulties = {
			Easy = { { req = 10, reward = 15 }, { req = 20, reward = 30 }, { req = 30, reward = 45 } },
			Medium = { { req = 50, reward = 60 }, { req = 75, reward = 80 }, { req = 100, reward = 100 } },
			Hard = { { req = 150, reward = 135 }, { req = 200, reward = 170 }, { req = 250, reward = 205 } },
			Impossible = { { req = 500, reward = 280 }, { req = 750, reward = 355 }, { req = 1000, reward = 420 } },
		},
	},
	{
		id = "WinRounds",
		displayName = "     WIN %d ROUND     ",
		stat = "RoundsWon",
		trackable = true,
		difficulties = {
			Easy = { { req = 1, reward = 40 }, { req = 2, reward = 75 }, { req = 3, reward = 90 } },
			Medium = { { req = 4, reward = 120 }, { req = 6, reward = 140 }, { req = 8, reward = 175 } },
			Hard = { { req = 10, reward = 210 }, { req = 15, reward = 255 }, { req = 20, reward = 300 } },
			Impossible = { { req = 25, reward = 360 }, { req = 35, reward = 465 }, { req = 50, reward = 600 } },
		},
	},
	{
		id = "Emote",
		displayName = "     USE %d EMOTES     ",
		stat = "Emotes",
		trackable = false,
		difficulties = {
			Easy = { { req = 20, reward = 20 }, { req = 30, reward = 30 }, { req = 50, reward = 50 } },
			Medium = { { req = 75, reward = 60 }, { req = 100, reward = 70 }, { req = 150, reward = 90 } },
			Hard = { { req = 250, reward = 125 }, { req = 350, reward = 150 }, { req = 500, reward = 200 } },
			Impossible = { { req = 750, reward = 260 }, { req = 1000, reward = 320 }, { req = 1500, reward = 400 } },
		},
	},
	{
		id = "DestroyTrainingTargets",
		displayName = "DESTROY %d TRAINING TARGETS",
		stat = "TrainingTargets",
		trackable = false,
		difficulties = {
			Easy = { { req = 10, reward = 20 }, { req = 15, reward = 30 }, { req = 20, reward = 40 } },
			Medium = { { req = 30, reward = 45 }, { req = 40, reward = 70 }, { req = 50, reward = 90 } },
			Hard = { { req = 75, reward = 115 }, { req = 100, reward = 150 }, { req = 125, reward = 195 } },
			Impossible = { { req = 150, reward = 230 }, { req = 200, reward = 285 }, { req = 250, reward = 370 } },
		},
	},
	{
		id = "PlayMinutes",
		displayName = "PLAY FOR %d MINUTES",
		stat = "MinutesPlayed",
		trackable = true,
		difficulties = {
			Easy = { { req = 5, reward = 20 }, { req = 10, reward = 40 }, { req = 15, reward = 60 } },
			Medium = { { req = 20, reward = 80 }, { req = 30, reward = 105 }, { req = 45, reward = 130 } },
			Hard = { { req = 60, reward = 165 }, { req = 75, reward = 200 }, { req = 90, reward = 240 } },
			Impossible = { { req = 120, reward = 335 }, { req = 150, reward = 420 }, { req = 180, reward = 495 } },
		},
	},
}

local byId = {}
for _, quest in ipairs(questTypes) do
	byId[quest.id] = quest
end

local function getRollable()
	local out = {}
	for _, quest in ipairs(questTypes) do
		if quest.trackable then
			table.insert(out, quest)
		end
	end
	return out
end

local function get(id: string)
	return byId[id]
end

return {
	Difficulties = Difficulties,
	getRollable = getRollable,
	get = get,
	all = questTypes,
}
