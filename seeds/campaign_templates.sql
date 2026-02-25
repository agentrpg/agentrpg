-- Campaign Templates
-- Ready-to-use adventure frameworks for GMs

INSERT INTO campaign_templates (slug, name, description, setting, themes, recommended_levels, session_count_estimate, starting_scene, initial_quests, initial_npcs) VALUES

('lost-mine-phandelver', 'Lost Mine of Phandelver', 
'Classic starter adventure. Escort a wagon, discover a lost mine, face a mysterious villain.',
'The Sword Coast. Small towns, wilderness, goblin caves, ancient dwarven mines.',
'Exploration, Mystery, Combat',
'1-5', 8,
'You''ve been hired by Gundren Rockseeker to escort a wagon of supplies from Neverwinter to Phandalin. The dwarf has gone ahead with a warrior escort. The road south leads through increasingly wild territory...',
'[{"title": "Escort the Wagon", "description": "Deliver supplies to Barthen''s Provisions in Phandalin", "status": "active"}]',
'[{"name": "Gundren Rockseeker", "title": "Dwarf Prospector", "disposition": "friendly", "notes": "Hired you. Has gone ahead."}]'
),

('death-house', 'Death House',
'Gothic horror one-shot. A haunted house with dark secrets. Perfect for a single session.',
'Barovia. Mist-shrouded land of dread. A seemingly innocent townhouse.',
'Horror, Mystery, Survival',
'1-3', 1,
'Thick fog rolls through the empty streets. Two children stand in the road, pleading for help. Their house, they say, has a monster in the basement. The townhouse looms behind them, its windows dark...',
'[{"title": "Save the Children", "description": "Investigate the house and deal with the monster", "status": "active"}]',
'[{"name": "Rose", "title": "Ghost Child", "disposition": "desperate", "notes": "Begs for help. Something is wrong."}, {"name": "Thorn", "title": "Ghost Child", "disposition": "frightened", "notes": "Clings to his sister."}]'
),

('sunless-citadel', 'The Sunless Citadel',
'Dungeon crawl into an ancient fortress. Two factions vie for control. Choose your allies.',
'A ravine in the wilderness. An ancient citadel, long fallen into the earth.',
'Dungeon Crawl, Faction Politics, Exploration',
'1-3', 4,
'The old fortress was swallowed by the earth in a cataclysm generations ago. Now, strange creatures emerge from the ravine. Locals whisper of a "Gulthias Tree" and goblins who trade magical fruit...',
'[{"title": "Find the Missing Adventurers", "description": "A group went into the citadel weeks ago. Find them.", "status": "active"}, {"title": "Investigate the Magic Fruit", "description": "Goblins sell fruit that heals or harms. Where does it come from?", "status": "active"}]',
'[{"name": "Kerowyn Hucrele", "title": "Merchant", "disposition": "desperate", "notes": "Her children went into the citadel. Offers reward."}]'
),

('wild-sheep-chase', 'A Wild Sheep Chase',
'Comedy one-shot. A wizard polymorphed into a sheep needs your help. Chaos ensues.',
'Any town or city. A wizard''s tower. Pure comedic fantasy.',
'Comedy, Chase, Light-hearted',
'4-5', 1,
'You''re enjoying a quiet meal at the tavern when a sheep bursts through the door, bleating frantically. It runs directly to your table and... speaks. "Please, you must help me! My apprentice has gone mad!"',
'[{"title": "Help the Sheep-Wizard", "description": "The polymorphed wizard needs to get back to his tower", "status": "active"}]',
'[{"name": "Finethir Shinebright", "title": "Sheep (Polymorphed Wizard)", "disposition": "panicked", "notes": "Was polymorphed by his own apprentice. Needs help."}]'
),

('dragon-heist', 'Urban Intrigue', 
'City-based campaign. Politics, factions, heists, and a hidden treasure.',
'A major city. Guilds, nobles, criminals, and secrets around every corner.',
'Intrigue, Investigation, Urban Adventure',
'1-5', 12,
'The city never sleeps. You''ve arrived seeking fortune or fleeing trouble—perhaps both. A local tavern owner has a proposition: help him renovate an old property, and you can stay rent-free. But the building has history, and someone doesn''t want it disturbed...',
'[{"title": "Renovate the Tavern", "description": "Help Volo restore his new property", "status": "active"}]',
'[{"name": "Volo", "title": "Famous Author", "disposition": "friendly", "notes": "Eccentric. Knows everyone. Owns a tavern he can''t afford to fix."}]'
);
