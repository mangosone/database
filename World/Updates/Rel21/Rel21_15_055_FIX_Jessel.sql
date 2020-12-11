INSERT INTO db_scripts(script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3, 2010001, 1, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessel - Set to Active"),
(3, 2010001, 2, 15, 14915, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, "Jessel - Cast: Self Visual - Sleep Until Cancelled"),
(3, 2010001, 3, 28, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessel - State: Sleeping"),
(3, 2010001, 14, 14, 14915, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, "Jessel - Remove Aura: Self Visual - Sleep Until Cancelled"),
(3, 2010001, 15, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessel - State: Sitting"),
(3, 2010001, 16, 0, 0, 0, 0, 0, 0, 2000000467, 0, 0, 0, 0, 0, 0, 0, "Jessel - Text Emote: Wakes up startled."),
(3, 2010001, 21, 0, 0, 0, 0, 0, 0, 2000000468, 0, 0, 0, 0, 0, 0, 0, "Jessel - Say: Was it all a dream?"),
(3, 2010001, 26, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessel - Emote: ONESHOT_SHOUT"),
(3, 2010001, 32, 0, 0, 0, 20098, 71601, 23, 2000000469, 0, 0, 0, 0, 0, 0, 0, "Jane - Say: I'm right here"),
(3, 2010001, 37, 0, 0, 0, 0, 0, 0, 2000000470, 0, 0, 0, 0, 0, 0, 0, "Jessel - Say: It was all a dream"),
(3, 2010001, 40, 0, 0, 0, 20098, 71601, 23, 2000000471, 0, 0, 0, 0, 0, 0, 0, "Jane - Text Emote: Resumes playing on beach"),
(3, 2010001, 43, 15, 14915, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, "Jessel - Cast: Self Visual - Sleep Until Cancelled"),
(3, 2010001, 44, 28, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessel - State: Sleeping"),
(3, 2010001, 46, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessel - Set to Inactive");

INSERT INTO db_script_string(entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, type, language, emote, comment) VALUES
(2000000467, "%s wakes up, startled.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0 , 0 , NULL),
(2000000468, "Was... Was it all a dream? Azuremyst, Bloodmyst, Zangarmarsh, Shadowmoon... even Zul'Aman... Jane! Jane where are you!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10, 6, NULL),
(2000000469, "I'm right here, daddy. You've been asleep all day long. You sure must be tired!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10, 1, NULL),
(2000000470, "Ah, wonderful. It was all just a dream...", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10, 1, NULL),
(2000000471, "%s resumes playing on the beach.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0 , 0 , NULL);

UPDATE creature SET MovementType = 2 WHERE guid = 71602;

DELETE FROM creature_movement_template WHERE entry = 20100;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, orientation, model1, model2) VALUES
(20100,1,10520.5,-6504.38,1.28933,50000,2010001,0,0,0,0,0,0,0,5.48033,0,0),
(20100,2,10520.5,-6504.38,1.28933,120000,0,0,0,0,0,0,0,0,5.48033,0,0);
