-- Gnomish Army Knife innkeeper vendor rollout:
-- 1) Set buy price to 1 copper so all vendors charge the minimum
-- 2) Add item to the vendor list of every innkeeper NPC
--    UNIT_NPC_FLAG_INNKEEPER = 65536 (0x10000)

UPDATE `item_template`
SET `BuyPrice` = 1
WHERE `entry` = 40772;

INSERT IGNORE INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`)
SELECT `entry`, 0, 40772, 0, 0, 0
FROM `creature_template`
WHERE (`npcflag` & 65536) != 0;
