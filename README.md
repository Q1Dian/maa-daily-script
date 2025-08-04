# Maa-daily-script
Simple script and daily config for MaaAssistantArknights on linux for my personal use
It's a good template to start on as it is simple and effective

# How to use
1. Install [maa-cli](https://github.com/MaaAssistantArknights/maa-cli)
2. put [Daily for YoStarEN](daily.toml) or [Daily for Bilibili](dbily.toml) in $MAA_CONFIG_DIR/tasks folder
3. run maa.sh

---

# Current behavior (I strongly recommend modifying maa.sh for your own usecase)
./maa.sh [-password]

No password will default to [YoStarEN Daily](daily.toml)

Naving a password param will default to [Bilibili Daily](dbily.toml)

All tasks include:
- Unlock phone and set resolution to 1920x1080
- Startup
- Recruit
- Infra
- Fight (Annihilation first)
- Fight (1-7)
- Mall (credit store)
- Award (Just the basic stuff e.g. Mail collection, Orundum from events, No daily pulls tho)
- Screenshot final result and open on screen (just to check if everything is actually done)
- Reset phone config
